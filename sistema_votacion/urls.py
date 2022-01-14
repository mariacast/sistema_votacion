"""sistema_votacion URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.contrib import admin
from votacionApi.views import *
from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter


router= DefaultRouter()
router.register('DepartamentoApiView', DepartamentoApiView)
router.register('MunicipioApiView', MunicipioApiView)
router.register('PuestoVotacionApiView', PuestoVotacionApiView)


urlpatterns = [

    url('api/', include(router.urls)),

    #url(r'^admin/', admin.site.urls),
    url('^login',login, name='login'),
    url('VotanteCreate/', VotanteCreate.as_view(),name="VotanteCreate"),
    url('UsersCreate/', UsersCreate.as_view(),name="UsersCreate"),
    url('PuestoVotacionCreate/', PuestoVotacionCreate.as_view(),name="PuestoVotacionCreate"),
    url('DepartamentoCreate/', DepartamentoCreate.as_view(),name="DepartamentoCreate"),
    url('MunicipioCreate/', MunicipioCreate.as_view(),name="MunicipioCreate"),
    url('BarrioCreate/', BarrioCreate.as_view(),name="BarrioCreate"),

    url(
        r'^VotosLiderApiView/(?P<pk>\d+)/$',
        VotosLiderApiView.as_view({'get': 'retrieve'}),
        name='user-detail',
    ),
    url(
        r'^VotantesApiView/',
        VotantesApiView.as_view({'get': 'list'}),
        name='user-list',
    ),

    url('VotantesList/', VotantesList.as_view(),name="VotantesList"),
    url('UsersList/', UsersList.as_view(),name="UsersList"),
    url('PuestoVotacionList/', PuestoVotacionList.as_view(),name="PuestoVotacionList"),
    url('DepartamentosList/', DepartamentosList.as_view(),name="DepartamentosList"),
    url('MunicipiosList/', MunicipiosList.as_view(),name="MunicipiosList"),
    url('BarriosList/', BarriosList.as_view(),name="BarriosList"),

    url(r'^VotanteUpdate/(?P<pk>\d+)$', VotanteUpdate.as_view(),name="VotanteUpdate"),
    url(r'^UsersUpdate/(?P<pk>\d+)$', UsersUpdate.as_view(),name="UsersUpdate"),
    url(r'^PuestoVotacionUpdate/(?P<pk>\d+)$', PuestoVotacionUpdate.as_view(),name="PuestoVotacionUpdate"),
    url(r'^DepartamentoUpdate/(?P<pk>\d+)$', DepartamentoUpdate.as_view(),name="DepartamentoUpdate"),
    url(r'^MunicipiosUpdate/(?P<pk>\d+)$', MunicipiosUpdate.as_view(),name="MunicipiosUpdate"),
    url(r'^BarrioUpdate/(?P<pk>\d+)$', BarrioUpdate.as_view(),name="BarrioUpdate"),
]
