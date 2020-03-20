from matchInfo.models import Player, Match, PlayerPerformance
from django.db.models import Sum
from datetime import datetime
from django.db.models import Q

today_date = datetime.now()



def get_players(team):
    # returns players list of a team
    return Player.objects.filter(team=team)


def get_past_matches_data(team):
    """
    this function returns list with
    1- Past Matches
    2- Winner
    """
    matches = team.get_past_matches()
    match_list = []
    for match in matches:
        match_dict = {}
        match_dict['match_date'] =  match.match_date
        match_dict['match_name'] = match.__str__()
        match_dict['id'] = match.id
        innings = match.get_innings()
        if len(innings):
            if innings[0].runs > innings[1].runs:
                match_dict['winner_team'] = innings[0].bat_team
                match_dict['win_margin'] = innings[0].runs - innings[1].runs
                match_dict['win_type'] = 'Runs'
                match_dict['winner_score'] = str(innings[0].runs) + '/' + str(innings[0].wickets)
            else:
                match_dict['winner_team'] = innings[1].bat_team
                match_dict['win_margin'] = 10 - innings[1].wickets
                match_dict['win_type'] = 'Wickets'
                match_dict['winner_score'] = str(innings[1].runs) + '/' + str(innings[1].wickets)
        match_list.append(match_dict)
    return match_list


def team_get_win_loose_count(team):
    matches = team.get_past_matches()
    count = {'win':0, 'loose':0}
    for match in matches:
        innings = match.get_innings()
        if len(innings)>0:
            if innings[0].runs > innings[1].runs:
                if innings[0].bat_team == team:
                    count['win'] = count['win'] + 1
                else:
                    count['loose'] = count['loose'] + 1
            else:
                if innings[1].bat_team == team:
                    count['win'] = count['win'] + 1
                else:
                    count['loose'] = count['loose'] + 1
    return count


def get_future_matches(team):
    # returns list of future matches to be played by a team
    return Match.objects.filter(Q(team_1=team) | Q(team_2=team), match_date__gte=today_date)


