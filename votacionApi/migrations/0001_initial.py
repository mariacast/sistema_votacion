# Generated by Django 3.2.11 on 2022-01-13 18:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Barrio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Departamento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Lider',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombres', models.CharField(max_length=50)),
                ('apellidos', models.CharField(max_length=50)),
                ('identificacion', models.CharField(max_length=50)),
                ('celular', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=50)),
                ('barrio', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='votacionApi.barrio', verbose_name='Barrio')),
            ],
        ),
        migrations.CreateModel(
            name='Municipio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('departamento', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='votacionApi.departamento', verbose_name='Departamento')),
            ],
        ),
        migrations.CreateModel(
            name='PuestoVotacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=50)),
                ('municipio', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='votacionApi.municipio', verbose_name='Municipio')),
            ],
        ),
        migrations.CreateModel(
            name='Usuarios',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=50)),
                ('password', models.TextField()),
                ('rol', models.PositiveIntegerField(choices=[(1, 'ADMINISTRADOR'), (2, 'LIDER')])),
            ],
        ),
        migrations.CreateModel(
            name='Votante',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombres', models.CharField(max_length=50)),
                ('apellidos', models.CharField(max_length=50)),
                ('identificacion', models.CharField(max_length=50)),
                ('celular', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=50)),
                ('num_mesa', models.CharField(max_length=50)),
                ('lider', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='votacionApi.lider', verbose_name='Lider')),
                ('puesto_votacion', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='votacionApi.puestovotacion', verbose_name='PuestoVotacion')),
            ],
        ),
    ]
