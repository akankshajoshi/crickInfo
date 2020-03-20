from django.shortcuts import render
from .models import Team, Match, PlayerPerformance, Player
from django.views import View
from .utils import get_players, get_past_matches_data, get_future_matches, team_get_win_loose_count
from django.http import HttpResponse
from django.db.models import Avg, Sum
from .templatetags.my_tags import get_strike_rate, get_overs
from django.core.exceptions import ObjectDoesNotExist

class TeamListView(View):
    """
    This view is responsible for
    1- Team List
    2- Matches played by each team
    3- Matches won
    4- Matches lost
    5- Points
    """
    template_name = 'matchInfo/team_list.html'

    def get(self, request):
        item_list = Team.objects.all()
        data_list = []
        for item in item_list:
            data_dict = {}
            data_dict['id'] = item.id
            data_dict['name'] = item.name
            data_dict['path'] = item.logo_uri.url
            data_dict['total_matches'] = item.get_past_match_count()
            count = team_get_win_loose_count(item)
            data_dict['won_matches'] = count['win']
            data_dict['loose_matches'] = count['loose']
            data_list.append(data_dict)
        if not len(data_list):
            return HttpResponse('Something went wrong')
        data_list = sorted(data_list, key=lambda i: i['won_matches'], reverse=True)
        return render(request, self.template_name, {'data_list': data_list})


class TeamDetailView(View):
    """
    This view is responsible for:
    1- Team Details
    2- Players list
    3- Past Matches with score link
    4- Future Matches
    """
    template_name = 'matchInfo/details.html'

    def get_object(self, **kwargs):
        return int(kwargs['id'])

    def get(self, request, id):
        team_obj = Team.objects.filter(id=id)
        if len(team_obj):
            team_players = get_players(team_obj[0])
            past_matches = get_past_matches_data(team_obj[0])
            future_matches = get_future_matches(team_obj[0])
            return render(request, self.template_name, {'team': team_obj[0], 'team_players': team_players,\
                                                    'past_matches':past_matches, 'future_matches':future_matches})
        return HttpResponse('Something went wrong')


class MatchDetailView(View):
    """
    This view is responsible for:
    1-Innings Info
    2-All player performance stats
    3-Batting and bowling numbers
    """

    template_name = 'matchInfo/match_details.html'

    def get_object(self, **kwargs):
        return int(kwargs['id'])

    def get(self, request, id):
        try:
            match = Match.objects.get(id=id)
        except ObjectDoesNotExist:
            return render(request, self.template_name, {})

        if match is not None:
            team1_players = match.get_team1_player()
            team2_players = match.get_team2_player()

            # team wise player performance
            team1_performance_list = PlayerPerformance.objects.filter(player__in=team1_players, match=match)
            team2_performance_list = PlayerPerformance.objects.filter(player__in=team2_players, match=match)

            team1_dict = {'runs':0, 'balls':0}
            team2_dict = {'runs': 0, 'balls': 0}

            team1_runs = team1_performance_list.aggregate(Sum('total_runs_scored'))
            team2_runs = team2_performance_list.aggregate(Sum('total_runs_scored'))

            team1_balls = team1_performance_list.aggregate(Sum('total_balls_played'))
            team2_balls = team1_performance_list.aggregate(Sum('total_balls_played'))

            team1_dict['runs'] = team1_runs['total_runs_scored__sum']
            team2_dict['runs'] = team2_runs['total_runs_scored__sum']

            team1_dict['balls'] = team1_balls['total_balls_played__sum']
            team2_dict['balls'] = team2_balls['total_balls_played__sum']

            return render(request, self.template_name, {'team1_performance_list':team1_performance_list,\
                                                        'team2_performance_list':team2_performance_list,\
                                                        'match_name':match.__str__(), 'team1':match.team_1, \
                                                        'team2':match.team_2, 'team1_dict':team1_dict, 'team2_dict':team2_dict})


class PlayerPerformanceView(View):
    """
    This view is responsible for:
    1-NO of matches played by Player
    2-Total balls played
    3-Total runs made by player
    4-Total wickets taken by Player
    """
    template_name = 'matchInfo/player_performance.html'

    def get_object(self, **kwargs):
        return int(kwargs['id'])

    def get(self, request, id):
        player = Player.objects.get(id=id)
        player_performances = PlayerPerformance.objects.filter(player=player)
        batting_dict = {'matches':0, 'runs':0, 'strike_rate':0, '50s':0, '100s':0, 'balls_played':0}
        bowling_dict = {'matches':0, 'overs':0, 'run_conceived':0, 'wickets':0, 'avg':0, 'strike_rate':0}

        total_matches =  player_performances.count()
        if total_matches > 0:
            #batting data
            batting_dict['matches'] = total_matches
            runs = player_performances.aggregate(Sum('total_runs_scored'))
            batting_dict['runs'] = runs['total_runs_scored__sum']
            total_balls = player_performances.aggregate(Sum('total_balls_played'))
            batting_dict['balls_played'] = total_balls['total_balls_played__sum']
            batting_dict['strike_rate'] = get_strike_rate(runs['total_runs_scored__sum'], total_balls['total_balls_played__sum'])
            batting_dict['50s'] = player_performances.filter(total_runs_scored__gte=50).count()
            batting_dict['100s'] = player_performances.filter(total_runs_scored__gte=100).count()

            #bowling data
            bowling_dict['matches'] = total_matches
            total_balls = player_performances.aggregate(Sum('total_balls_bowled'))
            overs = get_overs(total_balls['total_balls_bowled__sum'])
            bowling_dict['overs'] = overs if overs > 0 else 0
            total_run_conceived = player_performances.aggregate(Sum('total_run_conceived'))
            bowling_dict['run_conceived'] = total_run_conceived['total_run_conceived__sum']
            total_wickets_taken = player_performances.aggregate(Sum('total_wickets_taken'))
            bowling_dict['wickets'] = total_wickets_taken['total_wickets_taken__sum']
            bowling_dict['avg'] = 0
            if total_wickets_taken['total_wickets_taken__sum'] != 0:
                bowling_dict['avg'] = total_run_conceived['total_run_conceived__sum']/total_wickets_taken['total_wickets_taken__sum']
            total_balls_bowled = player_performances.aggregate(Sum('total_balls_bowled'))
            bowling_dict['strike_rate'] = 0
            if total_wickets_taken['total_wickets_taken__sum'] != 0:
                bowling_dict['strike_rate'] = total_balls_bowled['total_balls_bowled__sum']/total_wickets_taken['total_wickets_taken__sum']

        return render(request, self.template_name, {'batting_dict':batting_dict, 'bowling_dict':bowling_dict,\
                                                    'player':player})

