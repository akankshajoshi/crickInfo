from django.db import models

'''Models for Team, player match and points.'''


class Team(models.Model):
    # model to save team info
    name = models.CharField(max_length=200)
    logo_uri = models.ImageField(default="default.png", upload_to='team_logo')
    club_state = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        return self.name


class Player(models.Model):
    # model to save player info
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='players')
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    image_uri = models.ImageField(default="default.png", upload_to='player_image')
    jersey_number = models.IntegerField(null=True, blank=True)
    country = models.CharField(max_length=200, null=True, blank=True)
    player_history = models.CharField(max_length=200, null=True, blank=True)  #store in JSON format{'matches':20, \
    # 'run':800, 'highest_score':80, 'fifties':23, 'hundreds':5}

    def __str__(self):
        return self.first_name + " " + self.last_name


class Match(models.Model):
    # model to save match info between 2 teams
    team_1 = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='match_team_1')
    team_2 = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='match_team_2')
    match_date = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.team_1.name + " vs " + self.team_2.name


class Point(models.Model):
    # model to store points per match
    match = models.ForeignKey(Match, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    points = models.IntegerField()  #value of this fied will be 0(loose) or 1(win)

    def __str__(self):
        return str(self.match) + " - " + self.team.name + " - " + str(self.points)

