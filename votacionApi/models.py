from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

class Departamento(models.Model):
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre

class Municipio(models.Model):
    departamento = models.ForeignKey(Departamento, models.DO_NOTHING, verbose_name="Departamento",  null=True)
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre


class Barrio(models.Model):
    nombre = models.CharField(max_length=50)
    municipio = models.ForeignKey(Municipio,models.DO_NOTHING, verbose_name="Municipio" )
    def __str__(self):
        return self.nombre

class PuestoVotacion(models.Model):
    nombre = models.CharField(max_length=50)
    direccion = models.CharField(max_length=50)
    municipio = models.ForeignKey(Municipio,models.DO_NOTHING, verbose_name="Municipio" )
    latitud = models.CharField(max_length=200, null=True)
    longitud = models.CharField(max_length=200,  null=True)
    def __str__(self):
        return self.nombre

class Users(models.Model):
    ADMINISTRADOR = 1
    LIDER = 2
    ROL = ((ADMINISTRADOR, 'ADMINISTRADOR'), (LIDER, 'LIDER'))

    nombres = models.CharField(max_length=50)
    apellidos = models.CharField(max_length=50)
    identificacion = models.CharField(max_length=50)
    celular = models.CharField(max_length=50)
    direccion = models.CharField(max_length=50)
    barrio = models.ForeignKey(Barrio,models.DO_NOTHING, verbose_name="Barrio")
    username = models.CharField(max_length=50)
    password = models.TextField()
    rol = models.PositiveIntegerField(choices=ROL)
    latitud = models.CharField(max_length=200)
    longitud = models.CharField(max_length=200)
    def __str__(self):
        return self.nombres+" "+self.apellidos

class Votante(models.Model):
    nombres = models.CharField(max_length=50)
    apellidos = models.CharField(max_length=50)
    identificacion = models.CharField(max_length=50)
    celular = models.CharField(max_length=50)
    direccion = models.CharField(max_length=50)
    num_mesa = models.CharField(max_length=50)
    lider = models.ForeignKey(Users, models.DO_NOTHING, verbose_name="Lider")
    puesto_votacion = models.ForeignKey(PuestoVotacion, models.DO_NOTHING, verbose_name="PuestoVotacion")
