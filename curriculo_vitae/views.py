from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.core import serializers
# Create your views here.
from .models import *


def index(request):
    return render(request, 'curriculo_vitae/login.html', {})


def buscar(request):
    if 'docente' in request.session:
        docente = Docente.objects.get(cod_docente=request.session['docente'])
        publicaciones = Publicacion.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        estudios = Estudio.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        idiomas = Docente_Idioma.objects.filter(docente__cod_docente=request.session['docente'], estado='1')
        continua = Formacion_Continua.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        distincion = Distincion.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        evento = Evento.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        experiencia = Experiencia.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        investigacion = Investigacion.objects.filter(cod_docente__cod_docente=request.session['docente'], estado='1')
        del request.session['docente']

        return render(request, 'curriculo_vitae/buscar_docente_invitado.html', {'publicaciones': publicaciones,
                                                                                'estudios': estudios,
                                                                                'idiomas': idiomas, 'continua': continua,
                                                                                'distincion': distincion,
                                                                                'evento': evento,
                                                                                'experiencia': experiencia,
                                                                                'investigacion': investigacion,
                                                                                'docente': docente})
    elif 'msg' in request.session:
        msg = request.session['msg']
        del request.session['msg']
        return render(request, 'curriculo_vitae/buscar_docente_invitado.html', {'msg': msg})


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
    elif 'user' in request.session and request.method == 'GET':
        return HttpResponseRedirect('curriculo_vitae')
    else:
        return HttpResponseRedirect('/')


def cerrar_sesion(request):
    del request.session['user']
    return HttpResponseRedirect('/')


def get_docentes(request):
    personas = Persona.objects.all().order_by('apellido1')
    data = serializers.serialize('json', personas, fields=('nombre1', 'nombre2', 'apellido1', 'apellido2'))
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


def add_distincion(request):
    if request.method == 'POST':
        distincion = Distincion()
        distincion.cod_docente_id = request.session['user']
        distincion.usuario_registro = request.session['user']
        distincion.tipo_distincion = request.POST['tipo_distincion']
        distincion.nombre = request.POST['nombre_distincion']
        distincion.entidad = request.POST['entidad_distincion']
        distincion.fecha = request.POST['fecha_distincion']
        distincion.ambito = request.POST['ambito_distincion']
        distincion.municipio_id = request.POST['municipio_distincion']
        distincion.save()
        request.session['msg'] = 'Distincion Registrada Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_estudio(request):
    if request.method == 'POST':
        estudio = Estudio()
        estudio.cod_docente_id = request.session['user']
        estudio.usuario_registro = request.session['user']
        estudio.tipo_formacion_id = request.POST['tipo_formacion_estudio']
        estudio.titulo_obtenido = request.POST['titulo_estudio']
        estudio.institucion_id = request.POST['institucion_estudio']
        estudio.municipio_id = request.POST['municipio_estudio']
        estudio.semestres = request.POST['semestre_estudio']
        estudio.fecha_inicio = request.POST['fecha_inicio_estudio']
        estudio.fecha_titulo = request.POST['fecha_titulo_estudio']
        estudio.save()
        request.session['msg'] = 'Estudio Registrado Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_evento(request):
    if request.method == 'POST':
        evento = Evento()
        evento.cod_docente_id = request.session['user']
        evento.usuario_registro = request.session['user']
        evento.nombre = request.POST['nombre_evento']
        evento.fecha = request.POST['fecha_evento']
        evento.lugar = request.POST['luger_evento']
        evento.direccion = request.POST['direccion_evento']
        evento.tipo_evento_id = request.POST['tipo_evento']
        evento.tipo_parcipacion_id = request.POST['tipo_participacion_evento']
        evento.descripcion = request.POST['descripcion_evento']
        evento.save()
        request.session['msg'] = 'Parcicipacion de Evento Registrado Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_experiencia(request):
    if request.method == 'POST':
        experiencia = Experiencia()
        experiencia.cod_docente_id = request.session['user']
        experiencia.usuario_registro = request.session['user']
        experiencia.empresa = request.POST['epresa_esperiencia']
        experiencia.fecha_inicio = request.POST['fecha_inicio_experiencia']
        experiencia.fecha_fin = request.POST['fecha_fin_experiencia']
        experiencia.cargo = request.POST['cargo_experiencia']
        experiencia.direccion = request.POST['direccion_experiencia']
        experiencia.telefono = request.POST['telefono_experiencia']
        experiencia.funciones = request.POST['funciones_experiencia']
        experiencia.save()
        request.session['msg'] = 'Experiencia Laboral Registrada Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_continua(request):
    if request.method == 'POST':
        continua = Formacion_Continua()
        continua.cod_docente_id = request.session['user']
        continua.usuario_registro = request.session['user']
        continua.tipo_continua_id = request.POST['tipo_formacion_continua']
        continua.institucion_id = request.POST['institucion_continua']
        continua.municipio_id = request.POST['municipio_estudio']
        continua.intencidad = request.POST['intencidad_continua']
        continua.fecha_inicio = request.POST['fecha_inicio_continua']
        continua.fecha_terminacion = request.POST['fecha_terminacion_continua']
        continua.fecha_titulo = request.POST['fecha_titulo_continua']
        continua.descuento = request.POST['descuento_continua']
        continua.save()
        request.session['msg'] = 'Formacion Continua Registrada Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_idioma(request):
    if request.method == 'POST':
        idioma = Docente_Idioma()
        idioma.docente_id = request.session['user']
        idioma.usuario_registro = request.session['user']
        idioma.idioma_id = request.POST['tipo_idioma']
        idioma.nivel = request.POST['nivel_idioma']
        idioma.lectura = request.POST['lectura_idioma']
        idioma.escritura = request.POST['escritura_idioma']
        idioma.conversacion = request.POST['conversacion_idioma']
        idioma.save()
        request.session['msg'] = 'Idioma Registrado Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_investigacion(request):
    if request.method == 'POST':
        investigacion = Investigacion()
        investigacion.cod_docente_id = request.session['user']
        investigacion.usuario_registro = request.session['user']
        investigacion.tipo_investigacion_id = request.POST['tipo_invesigaciones']
        investigacion.nombre = request.POST['nombre_investigacion']
        investigacion.fecha = request.POST['fecha_investigacion']
        investigacion.descripcion = request.POST['descripcion_investigacion']
        investigacion.save()
        request.session['msg'] = 'Investigacion Registrada Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def add_publicacion(request):
    if request.method == 'POST':
        publicacion = Publicacion()
        publicacion.cod_docente_id = request.session['user']
        publicacion.usuario_registro = request.session['user']
        publicacion.tipo_publicacion_id = request.POST['tipo_publicacion']
        publicacion.nombre = request.POST['nombre_publicacion']
        publicacion.fecha = request.POST['fecha_publicacion']
        publicacion.idioma_id = request.POST['idioma_publicacion']
        publicacion.divulgacion = request.POST['divulgacion_publicacion']
        publicacion.sitio_web = request.POST['sitio_web_publicacion']
        publicacion.revista = request.POST['revista_publicacion']
        publicacion.periodico = request.POST['periodico_publicacion']
        publicacion.volumen = request.POST['volumen_publicacion']
        publicacion.editorial = request.POST['editorial_publicacion']
        publicacion.isbn = request.POST['isbn_publicacion']
        publicacion.descripcion = request.POST['descripcion_publicacion']
        publicacion.save()
        request.session['msg'] = 'Publicacion Registrada Exitosamente'
        return HttpResponse('ok')
    else:
        HttpResponseRedirect('/')


def docente_invitado(request):
    if request.method == 'POST':
        nombre = request.POST['nombre'].split(' ')
        if len(nombre) == 4:
            docentes = Docente.objects.filter(cedula__nombre1=nombre[0], cedula__nombre2=nombre[1],
                                              cedula__apellido1=nombre[2], cedula__apellido2=nombre[3])
        elif len(nombre) == 3:
            docentes = Docente.objects.filter(cedula__nombre1=nombre[0], cedula__nombre2=nombre[1],
                                              cedula__apellido1=nombre[2])
        elif len(nombre) == 2:
            docentes = Docente.objects.filter(cedula__nombre1=nombre[0], cedula__apellido1=nombre[2])
        else:
            request.session['msg'] = 'Docente no encontrado'
            return HttpResponseRedirect('buscar')

        if len(docentes) > 0:
            request.session['docente'] = docentes[0].cod_docente
            return HttpResponseRedirect('buscar')
        else:
            request.session['msg'] = 'Docente no encontrado'
            return HttpResponseRedirect('buscar')