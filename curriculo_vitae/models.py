from __future__ import unicode_literals

from django.db import models


class Estado_Civil(models.Model):
    id = models.CharField(max_length=1, primary_key=True)
    descripcion = models.CharField(max_length=10)

    def __unicode__(self):
        return self.descripcion


class Idioma(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    descripcion = models.CharField(max_length=30)

    def __unicode__(self):
        return self.descripcion


class Institucion(models.Model):
    id = models.CharField(max_length=5, primary_key=True)
    nombre = models.CharField(max_length=100)

    def __unicode__(self):
        return self.nombre


class Pais(models.Model):
    id = models.CharField(max_length=3, primary_key=True)
    nombre = models.CharField(max_length=20)

    def __unicode__(self):
        return self.nombre


class Tipo_Continua(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    descripcion = models.CharField(max_length=30)

    def __unicode__(self):
        return self.descripcion


class Tipo_Documento(models.Model):
    id = models.CharField(max_length=1, primary_key=True)
    descripcion = models.CharField(max_length=20)

    def __unicode__(self):
        return self.descripcion


class Tipo_Evento(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    descripcion = models.CharField(max_length=50)

    def __unicode__(self):
        return self.descripcion


class Tipo_Formacion(models.Model):
    id = models.CharField(max_length=3, primary_key=True)
    descripcion = models.CharField(max_length=30)

    def __unicode__(self):
        return self.descripcion


class Tipo_Investigacion(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    descripcion = models.CharField(max_length=50)

    def __unicode__(self):
        return self.descripcion


class Tipo_Participacion(models.Model):
    id = models.CharField(max_length=1, primary_key=True)
    descripcion = models.CharField(max_length=50)

    def __unicode__(self):
        return self.descripcion


class Tipo_Publicacion(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    descripcion = models.CharField(max_length=50)

    def __unicode__(self):
        return self.descripcion


class Departamento(models.Model):
    id = models.CharField(max_length=2, primary_key=True)
    nombre = models.CharField(max_length=20)
    id_pais = models.ForeignKey('Pais')

    def __unicode__(self):
        return self.nombre + ', pais: ' + self.id_pais.nombre


class Municipio(models.Model):
    id = models.CharField(max_length=5, primary_key=True)
    nombre = models.CharField(max_length=20)
    id_dpto = models.ForeignKey('Departamento')

    def __unicode__(self):
        return self.nombre + ', pais: ' + self.id_dpto.nombre


class Persona(models.Model):
    cedula = models.CharField(max_length=10, primary_key=True)
    nombre1 = models.CharField(max_length=20)
    nombre2 = models.CharField(max_length=20, null=True)
    apellido1 = models.CharField(max_length=20)
    apellido2 = models.CharField(max_length=20, null=True)
    nacionalidad = models.ForeignKey('Pais')
    tipo_doc = models.ForeignKey('Tipo_Documento')
    municipio_exp = models.ForeignKey('Municipio', related_name='municipio_exp')
    estado_civil = models.ForeignKey('Estado_Civil')
    municipio_nac = models.ForeignKey('Municipio', related_name='municipio_nac')
    tarjeta_profesional = models.CharField(max_length=15)
    sexo = models.CharField(max_length=1)
    fecha_nac = models.DateField()
    hijos = models.IntegerField()
    telefono1 = models.CharField(max_length=10)
    telefono2 = models.CharField(max_length=10, null=True)
    direccion = models.CharField(max_length=500)
    correo_inst = models.EmailField(max_length=30)
    correo_oper = models.EmailField(max_length=30)
    twitter = models.CharField(max_length=30)
    facebook = models.CharField(max_length=30)
    sitioweb = models.CharField(max_length=30)

    def __unicode__(self):
        return 'Cedula: %s Nombre: %s %s %s %s' % (self.cedula, self.nombre1, self.nombre2, self.apellido1,
                                                   self.apellido2)


class Docente(models.Model):
    cod_docente = models.CharField(max_length=5, primary_key=True)
    cedula = models.OneToOneField('Persona')
    clave = models.CharField(max_length=50)
    estado = models.CharField(max_length=1, default='1')  # default activo
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=10)
    fecha_activacion = models.DateField(null=True)

    def __unicode__(self):
        return 'cod: %s, Nombre: %s %s %s %s, Estado: %s' % (self.cod_docente, self.cedula.nombre1, self.cedula.nombre2,
                                                             self.cedula.apellido1, self.cedula.apellido2,
                                                             str(self.estado))

    def comparar_clave(self, clave2):
        if self.clave == clave2:
            return True
        return False


class Investigacion(models.Model):
    cod_docente = models.ForeignKey('Docente')
    nombre = models.CharField(max_length=30)
    fecha = models.DateField()
    tipo_investigacion = models.ForeignKey('Tipo_Investigacion')
    descripcion = models.CharField(max_length=500)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)

    def __unicode__(self):
        return 'Nombre:  %s, Tipo de investigacion: %s, fecha: %s, Estado: %s' % (
            self.nombre, self.tipo_investigacion.descripcion,
            str(self.fecha), self.estado)


class Distincion(models.Model):
    cod_docente = models.ForeignKey('Docente')
    tipo_distincion = models.CharField(max_length=2)
    nombre = models.CharField(max_length=50)
    fecha = models.DateField()
    entidad = models.CharField(max_length=50)
    municipio = models.ForeignKey('Municipio')
    ambito = models.CharField(max_length=1)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)

    def __unicode__(self):
        return 'Nombre:  %s, Tipo de distincion: %s, fecha: %s, Estado: %s' % (self.nombre, self.tipo_distincion,
                                                                               str(self.fecha), self.estado)


class Evento(models.Model):
    cod_docente = models.ForeignKey('Docente')
    nombre = models.CharField(max_length=30)
    fecha = models.DateField()
    direccion = models.CharField(max_length=500)
    lugar = models.CharField(max_length=5)
    tipo_evento = models.ForeignKey('Tipo_Evento')
    tipo_parcipacion = models.ForeignKey('Tipo_Participacion')
    descripcion = models.CharField(max_length=500)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return 'Nombre:  %s, Tipo de evento: %s, fecha: %s, Estado: %s' % (self.nombre, self.tipo_evento.descripcion,
                                                                           str(self.fecha), self.estado)


class Experiencia(models.Model):
    cod_docente = models.ForeignKey('Docente')
    empresa = models.CharField(max_length=50)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    cargo = models.CharField(max_length=50)
    direccion = models.CharField(max_length=500)
    telefono = models.CharField(max_length=10)
    funciones = models.CharField(max_length=500)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)
    lugar = models.CharField(max_length=5)

    def __unicode__(self):
        return 'Empresa:  %s, cargo: %s' % (self.empresa, self.cargo)


class Docente_Idioma(models.Model):
    class Meta:
        unique_together = ('docente', 'idioma')

    docente = models.ForeignKey('Docente')
    idioma = models.ForeignKey('Idioma')
    nivel = models.CharField(max_length=1)
    lectura = models.CharField(max_length=1)
    escritura = models.CharField(max_length=1)
    conversacion = models.CharField(max_length=1)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)

    def __unicode__(self):
        return 'Idioma:  %s, nivel: %s, lectura:  %s, escritura: %s, conversacion: %s' % (self.idioma.descripcion,
                                                                                          self.nivel, self.lectura,
                                                                                          self.escritura,
                                                                                          self.conversacion)


class Estudio(models.Model):
    cod_docente = models.ForeignKey('Docente')
    tipo_formacion = models.ForeignKey('Tipo_Formacion')
    titulo_obtenido = models.CharField(max_length=50)
    institucion = models.ForeignKey('Institucion')
    municipio = models.ForeignKey('Municipio')
    semestres = models.CharField(max_length=2)
    fecha_inicio = models.DateField()
    fecha_titulo = models.DateField()
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)

    def __unicode__(self):
        return 'tipo formacion: %s  , titulo: %s, Institucion: %s ' % (self.tipo_formacion.descripcion,
                                                                       self.titulo_obtenido, self.institucion)


class Formacion_Continua(models.Model):
    cod_docente = models.ForeignKey('Docente')
    tipo_continua = models.ForeignKey('Tipo_Continua')
    institucion = models.ForeignKey('Institucion')
    municipio = models.ForeignKey('Municipio')
    intencidad = models.CharField(max_length=2)
    fecha_inicio = models.DateField()
    fecha_terminacion = models.DateField()
    fecha_titulo = models.DateField()
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)

    def __unicode__(self):
        return 'tipo continua: %s  , institucion: %s, municipio: %s ' % (self.tipo_continua.descripcion,
                                                                         self.institucion.nombre,
                                                                         self.municipio.nombre)


class Publicacion(models.Model):
    cod_docente = models.ForeignKey('Docente')
    tipo_publicacion = models.ForeignKey('Tipo_Publicacion')
    nombre = models.CharField(max_length=100)
    fecha = models.DateField()
    idioma = models.ForeignKey('Idioma')
    divulgacion = models.CharField(max_length=30)
    sitio_web = models.CharField(max_length=50)
    revista = models.CharField(max_length=50)
    periodico = models.CharField(max_length=50)
    volumen = models.IntegerField()
    editorial = models.CharField(max_length=30)
    isbn = models.CharField(max_length=20)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1)
    descripcion = models.TextField(max_length=500)

    def __unicode__(self):
        return 'tipo publicacion: %s  , nombre: %s, fecha: %s ' % (self.tipo_publicacion.descripcion, self.nombre,
                                                                   self.fecha)
