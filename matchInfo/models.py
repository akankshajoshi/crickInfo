from django.db import models
import datetime
from django.db.models import Q

'''Models for Team, player match and performance.'''

today_date = datetime.datetime.now()


class Team(models.Model):
    # model to save team info
    name = models.CharField(max_length=200)
    logo_uri = models.ImageField(default="default.png", upload_to='team_logo')
    club_state = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        return self.name

    def get_past_match_count(self):
        return Match.objects.filter(Q(team_1=self.id) | Q(team_2=self.id), match_date__lte=today_date).count()

    def get_past_matches(self):
        return Match.objects.filter(Q(team_1=self.id) | Q(team_2=self.id), match_date__lte=today_date)


class Player(models.Model):
    # model to save player info
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='players')
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    image_uri = models.ImageField(default="default.png", upload_to='player_image')
    jersey_number = models.IntegerField(null=True, blank=True)
    country = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        return self.first_name + " " + self.last_name


class Match(models.Model):
    # model to save match info between 2 teams
    # assuming that team1 is playing batting first for now
    team_1 = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='match_team_1')
    team_2 = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='match_team_2')
    match_date = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.team_1.name + " vs " + self.team_2.name

    def get_innings(self):
        return MatchInning.objects.filter(match= self.id).order_by('inning_no')

    def get_team1_player(self):
        return [x.id for x in Player.objects.filter(team=self.team_1.id)]

    def get_team2_player(self):
        return [x.id for x in Player.objects.filter(team=self.team_2.id)]


class PlayerPerformance(models.Model):
    # Storing player information in every match
    match = models.ForeignKey(Match, on_delete=models.CASCADE, related_name='match')
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='player')
    total_balls_played = models.IntegerField(default=0)
    total_runs_scored = models.IntegerField(default=0)
    total_balls_bowled = models.IntegerField(default=0)
    total_wickets_taken = models.IntegerField(default=0)
    total_run_conceived = models.IntegerField(default=0)

    def __str__(self):
        return self.match.__str__() + " : " + self.player.__str__()


class MatchInning(models.Model):
    # Storing inning info
    match = models.ForeignKey('Match', on_delete=models.CASCADE)
    bat_team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='bat_team')
    bowl_team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='bowl_team')
    runs = models.IntegerField(default=0)
    wickets = models.IntegerField(default=0)
    total_balls = models.IntegerField(default=0)
    inning_no = models.IntegerField(default=0)

    def bat_team_name(self):
        return Team.objects.filter(pc_id=self.bat_team_id)[0].name

    def bowl_team_name(self):
        return Team.objects.filter(pc_id=self.bat_team_id)[0].name

    def __str__(self):
        return 'Inning ' + str(self.inning_no) + ': ' + str(self.match)


"""
class Point(models.Model):
    # model to store points per match
    match = models.ForeignKey(Match, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    points = models.IntegerField()  #value of this fied will be 0(loose) or 1(win)

    def __str__(self):
        return str(self.match) + " - " + self.team.name + " - " + str(self.points)

"""