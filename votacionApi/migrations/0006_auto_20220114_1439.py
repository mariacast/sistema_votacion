# Generated by Django 3.2.11 on 2022-01-14 14:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('votacionApi', '0005_auto_20220114_0404'),
    ]

    operations = [
        migrations.AlterField(
            model_name='puestovotacion',
            name='latitud',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='puestovotacion',
            name='longitud',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
