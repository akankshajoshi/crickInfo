# Generated by Django 2.2 on 2020-03-18 02:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('matchInfo', '0005_delete_point'),
    ]

    operations = [
        migrations.AddField(
            model_name='playerperformance',
            name='total_run_conceived',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='playerperformance',
            name='player',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='player', to='matchInfo.Player'),
        ),
        migrations.AlterField(
            model_name='playerperformance',
            name='total_balls_bowled',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='playerperformance',
            name='total_balls_played',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='playerperformance',
            name='total_runs_scored',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='playerperformance',
            name='total_wickets_taken',
            field=models.IntegerField(default=0),
        ),
        migrations.CreateModel(
            name='MatchInning',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('runs', models.IntegerField()),
                ('wickets', models.IntegerField()),
                ('total_balls', models.FloatField()),
                ('bat_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='bat_team', to='matchInfo.Team')),
                ('bowl_team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='bowl_team', to='matchInfo.Team')),
                ('match', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='matchInfo.Match')),
            ],
        ),
    ]
