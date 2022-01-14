from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from .models import *

class DepartamentoSerializer(ModelSerializer):
    class Meta:
        model = Departamento
        fields= '__all__'

class MunicipioSerializer(ModelSerializer):
    class Meta:
        model = Municipio
        fields= '__all__'

class PuestoVotacionSerializer(ModelSerializer):
    class Meta:
        model = PuestoVotacion
        fields= '__all__'

class VotantesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Votante
        fields= '__all__'
