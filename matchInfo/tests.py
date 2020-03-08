from django.test import TestCase, Client
from django.urls import reverse
from .models import Team

# Create your tests here.


class TeamListViewTest(TestCase):

    def setUp(self):
        self.client = Client()
        self.url = reverse('team_list')
        self.team = Team.objects.create(name='Test Team',\
                                        logo_uri='team_logo/Screen_Shot_2020-03-06_at_12.49.25_PM_2wr02g4.png',\
                                        club_state ='Test club')
        self.team.save()

    def tearDown(self):
        self.team.delete()

    def testTeamListView(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'matchInfo/team_list.html')


class TeamDetailViewTest(TestCase):

    def setUp(self):
        self.client = Client()
        self.team = Team.objects.create(name='Test Team',\
                                        logo_uri='team_logo/Screen_Shot_2020-03-06_at_12.49.25_PM_2wr02g4.png',\
                                        club_state ='Test club')
        self.team.save()
        self.url = reverse('detail', kwargs={'id': self.team.id})

    def tearDown(self):
        self.team.delete()

    def testTeamDetailView(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'matchInfo/details.html')
