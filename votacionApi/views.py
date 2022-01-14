from datetime import datetime, date, time, timedelta
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views.generic import ListView,CreateView,UpdateView,DeleteView, View
from .models import *
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string
from django.shortcuts import render, redirect
from django.template import RequestContext
from django.urls import reverse_lazy
from .forms import *
from django.views.generic.edit import FormMixin, ProcessFormView, FormView
from rest_framework.viewsets import ModelViewSet
from rest_framework import viewsets
from rest_framework.views import APIView
from .serializer import*
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

from django.urls import reverse

class VotanteCreate(CreateView):

    model: Votante
    form_class = VotantesForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('VotantesList')

class VotantesList(ListView):

    model = Votante
    template_name = 'showvotantes.html'
    fields = ['apellidos', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'VotantesList'
    actions = [
        {
            'url': 'VotanteUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
    table_title = 'Consultar personas'

class VotanteUpdate(UpdateView):
    model: Votante
    form_class = VotantesForm
    queryset =Votante.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('VotantesList')

class UsersCreate(CreateView):
    model: Users
    form_class = UsersForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('UsersList')


class UsersList(ListView):

    model = Users
    template_name = 'showusers.html'
    fields = ['apellidos', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'UsersList'
    actions = [
        {
            'url': 'UsersUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
    table_title = 'Consultar personas'

class UsersUpdate(UpdateView):
    model: Users
    form_class = UsersForm
    queryset =Users.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('UsersList')

class DepartamentoCreate(CreateView):
    model: Departamento
    form_class = DepartamentoForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('DepartamentoList')

class DepartamentosList(ListView):

    model = Departamento
    template_name = 'showdepartamentos.html'
    fields = ['apellidos', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'DepartamentosList'
    actions = [
        {
            'url': 'DepartamentoUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
class DepartamentoUpdate(UpdateView):
    model: Departamento
    form_class = DepartamentoForm
    queryset =Departamento.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('DepartamentosList')

###########################
class MunicipioCreate(CreateView):
    model: Municipio
    form_class = MunicipioForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('MunicipiosList')

class MunicipiosList(ListView):

    model = Municipio
    template_name = 'showmunicipios.html'
    fields = ['apellidos', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'MunicipioList'
    actions = [
        {
            'url': 'MunicipioUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
class MunicipiosUpdate(UpdateView):
    model: Municipio
    form_class = MunicipioForm
    queryset =Municipio.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('MunicipiosList')


class BarrioCreate(CreateView):
    model: Barrio
    form_class = BarrioForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('BarriosList')

class BarriosList(ListView):

    model = Barrio
    template_name = 'showbarrios.html'
    fields = ['apellidos', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'BarriosList'
    actions = [
        {
            'url': 'BarrioUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
class BarrioUpdate(UpdateView):
    model: Barrio
    form_class = BarrioForm
    queryset =Barrio.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('BarriosList')
#######################

class PuestoVotacionCreate(CreateView):
    model: PuestoVotacion
    form_class = PuestoVotacionForm
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('PuestoVotacionList')

class PuestoVotacionList(ListView):

    model = PuestoVotacion
    template_name = 'showpuestovot.html'
    fields = ['nombre', 'nombres']
    column_names = ['Apellidos', 'Nombres']
    ajax_url = 'PuestoVotacionList'
    actions = [
        {
            'url': 'PuestoVotacionUpdate',
            'url_params': ['pk'],
            'title': 'Editar',
            'icon': 'edit',
            'color': 'primary'
        }
    ]
    table_title = 'Consultar personas'

class PuestoVotacionUpdate(UpdateView):
    model: PuestoVotacion
    form_class = PuestoVotacionForm
    queryset =PuestoVotacion.objects.all()
    template_name= 'userRegistro.html'
    success_url = reverse_lazy('PuestoVotacionList')


class DepartamentoApiView(ModelViewSet):

    serializer_class =  DepartamentoSerializer
    queryset = Departamento.objects.all()

class MunicipioApiView(ModelViewSet):

    serializer_class =  MunicipioSerializer
    queryset = Municipio.objects.all()

class PuestoVotacionApiView(ModelViewSet):

    serializer_class =  PuestoVotacionSerializer
    queryset = PuestoVotacion.objects.all()

class VotosLiderApiView(viewsets.ModelViewSet):

    def get_queryset(self):
        vots = Votante.objects.all()
        return vots

    def retrieve(self, request, *args, **kwargs):
        params = kwargs
        votoslider = Votante.objects.filter(lider=params['pk']).count()

        return Response({'Cantidad de votantes inscritos por lider': votoslider, 'lider_id':params['pk']})

class VotantesApiView(viewsets.ModelViewSet):
    def list(self, request):
        votantes = Votante.objects.all().count()
        return Response({'Cantidad de votantes inscritos en total': votantes})


def login(request):

    if request.method == 'POST':

        usuario = request.POST['usuario']
        clave = request.POST['clave']
        acceso = authenticate(username = usuario, password = clave)
        error= "Usuario o Contraseña invalidos"

        if acceso == None:
            return render(request, 'login1.html', {'error': error})

        else:
            auth.login(request, acceso)
            usu =  User.objects.get(username=usuario)
            return HttpResponseRedirect('/UsersList')


    return render(request, "template/login1.html")
