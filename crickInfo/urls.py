"""crickInfo URL Configuration
"""
from django.contrib import admin
from django.urls import path
from matchInfo import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.TeamListView.as_view(), name='team_list'),
    path('<int:id>/', views.TeamDetailView.as_view(), name='detail'),
    path('match/<int:id>/', views.MatchDetailView.as_view(), name='match_detail'),
    path('player/<int:id>/', views.PlayerPerformanceView.as_view(), name='player_detail'),
]

urlpatterns = urlpatterns + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
