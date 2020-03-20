import math
from django import template


register = template.Library()


@register.simple_tag
def get_strike_rate(total_runs, balls_played):
    # strike rate for batsmen
    try:
        return math.trunc((total_runs/balls_played)*100)
    except (ValueError, ZeroDivisionError):
        return 'N/A'


@register.simple_tag
def get_overs(balls):
    # calculating overs from total balls
    return math.trunc(balls / 6) + (balls%6) / 10


@register.simple_tag
def get_bowl_strike_rate(balls_bowled, wickets_taken):
    # bowlers strike rate
    try:
        return balls_bowled/wickets_taken
    except(ValueError, ZeroDivisionError):
        return 'N/A'



@register.simple_tag
def get_bowl_avg(run_conceived, wickets_taken):
    # bowlers avg rate
    try:
        return run_conceived/wickets_taken
    except(ValueError, ZeroDivisionError):
        return 'N/A'


@register.simple_tag
def get_bowl_eco(run_conceived, balls_bowled):
    # get bowlers economy
    try:
        overs = get_overs(balls_bowled)
        return run_conceived / overs
    except(ValueError, ZeroDivisionError):
        return 'N/A'


