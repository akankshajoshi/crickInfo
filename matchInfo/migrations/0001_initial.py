# Generated by Django 2.2 on 2020-03-06 06:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('match_date', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('logo_uri', models.URLField(max_length=500)),
                ('club_state', models.CharField(blank=True, max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Point',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('points', models.IntegerField()),
                ('match', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='matchInfo.Match')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='matchInfo.Team')),
            ],
        ),
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=200)),
                ('last_name', models.CharField(max_length=200)),
                ('image_url', models.URLField(max_length=300)),
                ('jersey_number', models.IntegerField(blank=True, null=True)),
                ('country', models.CharField(blank=True, max_length=200, null=True)),
                ('player_history', models.CharField(blank=True, max_length=200, null=True)),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='players', to='matchInfo.Team')),
            ],
        ),
        migrations.AddField(
            model_name='match',
            name='team_1',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_team_1', to='matchInfo.Team'),
        ),
        migrations.AddField(
            model_name='match',
            name='team_2',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='match_team_2', to='matchInfo.Team'),
        ),
    ]