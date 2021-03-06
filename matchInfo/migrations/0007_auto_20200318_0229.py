# Generated by Django 2.2 on 2020-03-18 02:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('matchInfo', '0006_auto_20200318_0205'),
    ]

    operations = [
        migrations.AddField(
            model_name='matchinning',
            name='inning_no',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='matchinning',
            name='runs',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='matchinning',
            name='total_balls',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='matchinning',
            name='wickets',
            field=models.IntegerField(default=0),
        ),
    ]
