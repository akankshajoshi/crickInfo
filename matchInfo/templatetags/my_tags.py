from django import template
from matchInfo.models import Point
from django.db.models import Sum

register = template.Library()


@register.simple_tag()
def match_count(team_obj, point_type):
    count = Point.objects.filter(team=team_obj, points=int(point_type)).count()
    return count


@register.simple_tag()
def point_count(team_obj):
    count = Point.objects.filter(team=team_obj).aggregate(Sum('points'))
    if not count:
        return 0
    return count['points__sum']
