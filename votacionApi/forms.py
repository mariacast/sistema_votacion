from django import forms
import hashlib
import urllib.request
from django.utils.encoding import smart_str
import json
import requests
from django.contrib.auth.hashers import make_password
from .models import *

class UsersForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(UsersForm, self).__init__(*args, **kwargs)

        barrio = Barrio.objects.all()
        self.fields['nombres'].widget = forms.TextInput(attrs={'class': 'one'})
        self.fields['apellidos'].widget= forms.TextInput(attrs={'class': 'one'})
        self.fields['identificacion'].widget = forms.NumberInput(attrs={'class': 'one'})
        self.fields['celular'].widget = forms.NumberInput(attrs={'class': 'one'})
        self.fields['direccion'].widget.attrs.update({'class': 'one'})
        self.fields['barrio'].queryset = barrio
        self.fields['barrio'].widget.attrs.update({'class': 'one'})
        self.fields['rol'].widget.attrs.update({'class': 'one'})
        self.fields['username'].widget.attrs.update({'class': 'one'})
        self.fields['password'].widget = forms.PasswordInput(attrs={'class': 'one', 'placeholder': 'Password'})
    class Meta:
        model = Users
        fields = ["nombres", "apellidos", "identificacion", "celular", "direccion", "barrio", "username", "password","rol"]
    def save(self, commit=True):
        usuario = User()
        usuario.first_name = self.cleaned_data['nombres'].upper()
        usuario.last_name = self.cleaned_data['apellidos'].upper()
        usuario.username = self.cleaned_data['username']
        usuario.password = make_password(self.cleaned_data['password'])
        usuario.is_active = True
        usuario.save()


        users = super().save(commit=False)
        contraseña= self.cleaned_data['password']
        m = hashlib.md5()
        m.update(contraseña.encode('utf8'))
        clave = m.hexdigest()


        dire = self.cleaned_data['direccion']

        location = urllib.parse.quote_plus(smart_str(dire))
        url = 'https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=AIzaSyC3Hzfw0PYz_jnMiEV5MZQXZqBSMzByiAE' % location
        print(url)

        response = urllib.request.urlopen(url).read()
        #print("response")
        #print(response)
        result = json.loads(response)
        #print("result")
        #print(result)
        if result['status'] == 'OK':
            lat = (result['results'][0]['geometry']['location']['lat'])
            lng = (result['results'][0]['geometry']['location']['lng'])

            users.latitud = lat
            users.longitud = lng
        users.password = clave
        if commit:
            users.save()
        return users

class VotantesForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(VotantesForm, self).__init__(*args, **kwargs)

        puesto_votacion = PuestoVotacion.objects.all()
        lider = Users.objects.filter(rol=2)
        self.fields['nombres'].widget.attrs.update({'class': 'one'})
        self.fields['apellidos'].widget.attrs.update({'class': 'one'})
        self.fields['identificacion'].widget = forms.NumberInput(attrs={'class': 'one'})
        self.fields['celular'].widget = forms.NumberInput(attrs={'class': 'one'})
        self.fields['direccion'].widget.attrs.update({'class': 'one'})
        self.fields['num_mesa'].widget = forms.NumberInput(attrs={'class': 'one'})
        self.fields['puesto_votacion'].queryset = puesto_votacion
        self.fields['puesto_votacion'].widget.attrs.update({'class': 'one'})
        self.fields['lider'].queryset = lider
        self.fields['lider'].widget.attrs.update({'class': 'one'})
    class Meta:
        model = Votante
        fields = ["nombres", "apellidos", "identificacion", "celular", "direccion", "num_mesa", "puesto_votacion", "lider"]


class PuestoVotacionForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(PuestoVotacionForm, self).__init__(*args, **kwargs)

        municipio = Municipio.objects.all()
        self.fields['nombre'].widget = forms.TextInput(attrs={'class': 'one'})
        self.fields['direccion'].widget = forms.TextInput(attrs={'class': 'one'})

        self.fields['municipio'].queryset = municipio
        self.fields['municipio'].widget.attrs.update({'class': 'one'})

    class Meta:
        model = PuestoVotacion
        fields = ["nombre", "direccion", "municipio"]

    def save(self, commit=True):
        puesto_vot = super().save(commit=False)

        dire = self.cleaned_data['direccion']

        location = urllib.parse.quote_plus(smart_str(dire))
        url = 'https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=AIzaSyC3Hzfw0PYz_jnMiEV5MZQXZqBSMzByiAE' % location
        print(url)

        response = urllib.request.urlopen(url).read()
        #print("response")
        #print(response)
        result = json.loads(response)
        #print("result")
        #print(result)
        if result['status'] == 'OK':
            lat = (result['results'][0]['geometry']['location']['lat'])
            lng = (result['results'][0]['geometry']['location']['lng'])

            puesto_vot.latitud = lat
            puesto_vot.longitud = lng
        if commit:
            puesto_vot.save()
        return puesto_vot


class DepartamentoForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(DepartamentoForm, self).__init__(*args, **kwargs)

        self.fields['nombre'].widget = forms.TextInput(attrs={'class': 'one'})


    class Meta:
        model = PuestoVotacion
        fields = ["nombre"]


class MunicipioForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(MunicipioForm, self).__init__(*args, **kwargs)
        departamento = Departamento.objects.all()
        self.fields['nombre'].widget = forms.TextInput(attrs={'class': 'one'})
        self.fields['departamento'].queryset = departamento
        self.fields['departamento'].widget.attrs.update({'class': 'one'})

    class Meta:
        model = Municipio
        fields = ["nombre", "departamento"]

class BarrioForm(forms.ModelForm):
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(BarrioForm, self).__init__(*args, **kwargs)
        municipio = Municipio.objects.all()
        self.fields['nombre'].widget = forms.TextInput(attrs={'class': 'one'})
        self.fields['municipio'].queryset = municipio
        self.fields['municipio'].widget.attrs.update({'class': 'one'})

    class Meta:
        model = Barrio
        fields = ["nombre", "municipio"]
