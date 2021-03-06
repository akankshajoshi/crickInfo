# Generated by Django 2.2 on 2020-03-06 07:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('matchInfo', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='player',
            name='image_url',
        ),
        migrations.AddField(
            model_name='player',
            name='image_uri',
            field=models.ImageField(default='player_img.png', upload_to='player_image'),
        ),
        migrations.AlterField(
            model_name='team',
            name='logo_uri',
            field=models.ImageField(default='team_logo.png', upload_to='team_logo'),
        ),
    ]
