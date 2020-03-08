from django.shortcuts import render
from .models import Match, Team, Point, Player
from django.views import View
from .utils import match_count, point_count, get_players, get_past_matches, get_future_matches
from django.http import HttpResponse


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
            data_dict['total_matches'] = item.point_set.count()
            data_dict['won_matches'] = match_count(item,1)
            data_dict['loose_matches'] = match_count(item, 0)
            data_dict['total_points'] = point_count(item)
            data_list.append(data_dict)
        if not len(data_list):
            return HttpResponse('Something went wrong')
        return render(request, self.template_name, {'data_list': data_list})



class TeamDetailView(View):

    """
    This view is responsible for:
    1- Team Details
    2- Players list
    3- Past Matches
    4- Future Matches
    """
    template_name = 'matchInfo/details.html'

    def get_object(self, **kwargs):
        return int(kwargs['id'])

    def get(self, request, id):
        team_obj = Team.objects.filter(id=id)
        if len(team_obj):
            team_players = get_players(team_obj[0])
            past_matches = get_past_matches(team_obj[0])
            future_matches = get_future_matches(team_obj[0])

            return render(request, self.template_name, {'team': team_obj[0], 'team_players': team_players,\
                                                    'past_matches':past_matches, 'future_matches':future_matches})
        return HttpResponse('Something went wrong')
