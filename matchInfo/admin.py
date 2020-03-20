from django.contrib import admin
from .models import Team, Player, Match, PlayerPerformance, MatchInning


admin.site.register(Team)
admin.site.register(Player)
admin.site.register(Match)
admin.site.register(PlayerPerformance)
admin.site.register(MatchInning)
