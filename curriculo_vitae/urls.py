from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^$', views.index),
    url(r'^buscar$', views.buscar),
    url(r'^get_docentes$', views.get_docentes),
    url(r'^login$', views.login),
    url(r'^cerrar_sesion$', views.cerrar_sesion),
    url(r'^form_add_docente$', views.form_add_docente),
    url(r'^get_municipios$', views.get_municipios),
    url(r'^add_docente$', views.add_docente),
    url(r'^curriculo_vitae$', views.curriculo_vitae),


    url(r'^add_distincion$', views.add_distincion),
    url(r'^add_estudio$', views.add_estudio),
    url(r'^add_evento$', views.add_evento),
    url(r'^add_experiencia$', views.add_experiencia),
    url(r'^add_continua$', views.add_continua),
    url(r'^add_idioma$', views.add_idioma),
    url(r'^add_investigacion$', views.add_investigacion),
    url(r'^add_publicacion$', views.add_publicacion),
]