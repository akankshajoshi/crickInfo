from matchInfo.models import Point, Player, Match
from django.db.models import Sum
from datetime import datetime
from django.db.models import Q

today_date = datetime.now()


def match_count(team_obj, point_type):
    # counting total number of matches played by a team
    count = Point.objects.filter(team=team_obj, points=int(point_type)).count()
    return count


def point_count(team_obj):
    # counting total points won by a team
    count = Point.objects.filter(team=team_obj).aggregate(Sum('points'))
    if not count:
        return 0
    return count['points__sum']


def get_players(team):
    # returns players list of a team
    return Player.objects.filter(team=team)


def get_past_matches(team):
    """
    this function returns list with
    1- Past Matches
    2- Winner
    """
    matches = Match.objects.filter(Q(team_1=team) | Q(team_2=team), match_date__lte=today_date)
    match_list = []
    for match in matches:
        match_dict = {}
        match_dict['name'] = match.__str__()
        match_dict['match_date'] = match.match_date
        team_point = match.point_set.filter(points=1)
        match_dict['winner'] = ''
        if len(team_point):
            match_dict['winner'] = team_point[0].team.name
        match_list.append(match_dict)
    return match_list


def get_future_matches(team):
    # returns list of future matches to be played by a team
    return Match.objects.filter(Q(team_1=team) | Q(team_2=team), match_date__gte=today_date)


