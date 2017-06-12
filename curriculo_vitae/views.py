from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.core import serializers
# Create your views here.
from .models import *


def index(request):
    return render(request, 'curriculo_vitae/login.html', {})


def buscar(request):
    return render(request, 'curriculo_vitae/buscar_docente_invitado.html', {})


def login(request):
    if request.method == 'POST' and 'user' in request.POST:
        try:
            docente = Docente.objects.get(cod_docente=request.POST['user'])
            if docente.comparar_clave(request.POST['password']):
                request.session['user'] = request.POST['user']
                return HttpResponseRedirect('curriculo_vitae')
            else:
                request.session['msg'] = 'La password del docente es incorrecta'
                return HttpResponseRedirect('/')
        except Docente.DoesNotExist:
            request.session['msg'] = 'codigo de docente no registrado'
            return HttpResponseRedirect('/')
        #return render(request, 'curriculo_vitae/buscar_docente_admin.html', {'user': request.POST['user']})
    elif 'user' in request.session and request.method == 'GET':
        return HttpResponseRedirect('curriculo_vitae')
    else:
        return HttpResponseRedirect('/')
    #return render(request, 'curriculo_vitae/buscar_docente_admin.html', {'user': request.session['user'], 'msg': msg})
    #return render(request, 'curriculo_vitae/buscar_docente_admin.html', {'user': request.session['user']})


def cerrar_sesion(request):
    del request.session['user']
    return HttpResponseRedirect('/')


def get_docentes(request):
    docentes = Docente.objects.all().order_by('cedula__apellido1')
    data = serializers.serialize('json', docentes, fields=('cod_docente'))
    return HttpResponse(data, content_type='application/json')


def form_add_docente(request):
    estado_civil = Estado_Civil.objects.all().order_by('descripcion')
    tipo_doc = Tipo_Documento.objects.all().order_by('descripcion')
    pais = Pais.objects.all().order_by('nombre')

    return render(request, 'curriculo_vitae/add_docente.html', {'user': request.session['user'],
                                                                'estado_civil': estado_civil, 'tipo_doc': tipo_doc,
                                                                'pais': pais})


def get_municipios(request):
    if request.method == 'GET' and 'pais' in request.GET:
        munipios = Municipio.objects.filter(id_dpto__id_pais=request.GET['pais'])
        data = serializers.serialize('json', munipios, fields=('nombre'))
        return HttpResponse(data, content_type='application/json')


def add_docente(request):
    if request.method == 'POST':
        try:
            persona = Persona.objects.get(cedula=request.POST['cedula'])
            return HttpResponse('error')
        except Persona.DoesNotExist:
            persona = Persona()
            persona.cedula = request.POST['cedula']
            persona.nombre1 = request.POST['nombre1']
            if 'nombre2' in request.POST:
                persona.nombre2 = request.POST['nombre2']
            persona.apellido1 = request.POST['apellido1']
            if 'apellido2' in request.POST:
                persona.apellido2 = request.POST['apellido2']
            try:
                nacionalidad = Pais.objects.get(id=request.POST['nacionalidad'])
                persona.nacionalidad = nacionalidad

                tipo_doc = Tipo_Documento.objects.get(id=request.POST['tipo_documento'])
                persona.tipo_doc = tipo_doc

                municipio_exp = Municipio.objects.get(id=request.POST['municipio_expe'])
                persona.municipio_exp = municipio_exp

                estado_civil = Estado_Civil.objects.get(id=request.POST['estado_civil'])
                persona.estado_civil = estado_civil

                municipio_nac = Municipio.objects.get(id=request.POST['municipio_nac'])
                persona.municipio_nac = municipio_nac
            except Pais.DoesNotExist:
                return HttpResponse('nac')
            except Tipo_Documento.DoesNotExist:
                return HttpResponse('doc')
            except Municipio.DoesNotExist:
                return HttpResponse('mun')
            except Estado_Civil.DoesNotExist:
                return HttpResponse('est')

            persona.tarjeta_profesional = request.POST['tarjetaprofesional']
            persona.sexo = request.POST['sexo']
            persona.fecha_nac = request.POST['fecha_nac']
            persona.hijos = request.POST['hijos']
            persona.telefono1 = request.POST['telefono1']
            if 'telefono2' in request.POST:
                persona.telefono2 = request.POST['telefono2']
            persona.direccion = request.POST['direccion']
            persona.correo_inst = request.POST['correoinst']
            persona.correo_oper = request.POST['correopers']
            persona.twitter = request.POST['twitter']
            persona.facebook = request.POST['facebook']
            persona.sitioweb = request.POST['sitioweb']
            persona.save()

            docente = Docente()
            docente.cedula = persona
            docente.cod_docente = request.POST['codigo_doc']
            docente.clave = request.POST['clave']
            docente.usuario_registro = request.session['user']
            docente.save()
            request.session['msg'] = 'Docente agregado con exito'
            return HttpResponseRedirect('login')


def curriculo_vitae(request):
    if request.method == 'GET':
        try:
            docente = Docente.objects.get(cod_docente=request.session['user'])
            publicaciones = Publicacion.objects.filter(cod_docente=docente)
            estudios = Estudio.objects.filter(cod_docente=docente)
            idiomas = Docente_Idioma.objects.filter(docente=docente)
            continua = Formacion_Continua.objects.filter(cod_docente=docente)
            distincion = Distincion.objects.filter(cod_docente=docente)
            evento = Evento.objects.filter(cod_docente=docente)
            experiencia = Experiencia.objects.filter(cod_docente=docente)
            investigacion = Investigacion.objects.filter(cod_docente=docente)
            municipio = Municipio.objects.all().order_by('id_dpto__nombre').order_by('id_dpto__id_pais__nombre')
            tipo_formacion = Tipo_Formacion.objects.all()
            institucion = Institucion.objects.all()
            tipos_eventos = Tipo_Evento.objects.all().order_by('descripcion')
            tipos_participacion = Tipo_Participacion.objects.all().order_by('descripcion')
            tipos_continua = Tipo_Continua.objects.all().order_by('descripcion')
            tipos_idiomas = Idioma.objects.all().order_by('descripcion')
            tipo_investigaciones = Tipo_Investigacion.objects.all().order_by('descripcion')
            tipo_publicacion = Tipo_Publicacion.objects.all().order_by('descripcion')

            if 'msg' in request.session:
                msg = request.session['msg']
                del request.session['msg']
                return render(request, 'curriculo_vitae/curriculo_vitae.html', {'publicaciones': publicaciones,
                                                                            'estudios': estudios, 'idiomas': idiomas,
                                                                                'continua': continua, 'evento': evento,
                                                                                'distincion': distincion,
                                                                                'experiencia': experiencia,
                                                                            'investigacion': investigacion, 'msg': msg,
                                                                                'docente': docente,
                                                                                'municipio': municipio,
                                                                                'tipo_formacion': tipo_formacion,
                                                                                'institucion': institucion,
                                                                                'tipos_eventos': tipos_eventos,
                                                                            'tipos_participacion': tipos_participacion,
                                                                                'tipos_continua': tipos_continua,
                                                                                'tipos_idiomas': tipos_idiomas,
                                                                                'tipo_investigaciones': tipo_investigaciones,
                                                                                'tipo_publicacion': tipo_publicacion})

            return render(request, 'curriculo_vitae/curriculo_vitae.html', {'publicaciones': publicaciones,
                                                                            'estudios': estudios, 'idiomas': idiomas,
                                                                            'continua': continua, 'evento': evento,
                                                                            'distincion': distincion,
                                                                            'experiencia': experiencia,
                                                                            'investigacion': investigacion,
                                                                            'docente': docente, 'municipio': municipio,
                                                                            'tipo_formacion': tipo_formacion,
                                                                            'institucion': institucion,
                                                                            'tipos_eventos': tipos_eventos,
                                                                            'tipos_participacion': tipos_participacion,
                                                                            'tipos_continua': tipos_continua,
                                                                            'tipos_idiomas': tipos_idiomas,
                                                                            'tipo_investigaciones': tipo_investigaciones,
                                                                            'tipo_publicacion': tipo_publicacion})

        except Docente.DoesNotExist:
            request.session['msg'] = 'El codigo no se encuentra registrado'
            return HttpResponseRedirect('cerrar_sesion')