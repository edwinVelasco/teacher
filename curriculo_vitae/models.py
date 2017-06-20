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
        return 'Nombre: %s %s %s %s' % (self.nombre1, self.nombre2, self.apellido1, self.apellido2)


class Docente(models.Model):
    cod_docente = models.CharField(max_length=5, primary_key=True)
    cedula = models.OneToOneField('Persona')
    clave = models.CharField(max_length=50)
    estado = models.CharField(max_length=1, default='1')  # default activo
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=10)
    fecha_activacion = models.DateField(null=True)

    def __unicode__(self):
        return 'cod: %s, %s' % (self.cod_docente, self.cedula)

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
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return '%s inventigacion: %s' % (self.cod_docente, self.nombre)


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
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return '%s, Distincion:  %s' % (self.cod_docente, self.nombre)


class Evento(models.Model):
    cod_docente = models.ForeignKey('Docente')
    nombre = models.CharField(max_length=30)
    fecha = models.DateField()
    direccion = models.CharField(max_length=500)
    lugar = models.CharField(max_length=50)
    tipo_evento = models.ForeignKey('Tipo_Evento')
    tipo_parcipacion = models.ForeignKey('Tipo_Participacion')
    descripcion = models.CharField(max_length=500)
    fecha_registro = models.DateField(auto_now=True)
    usuario_registro = models.CharField(max_length=20)
    fecha_autenticacion = models.DateField(null=True)
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return '%s, Evento:  %s' % (self.cod_docente, self.nombre)


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
    estado = models.CharField(max_length=1, default='0')
    lugar = models.CharField(max_length=5)

    def __unicode__(self):
        return '%s, Empresa:  %s' % (self.cod_docente, self.empresa)


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
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return '%s, Idioma:  %s' % (self.docente, self.idioma)


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
    estado = models.CharField(max_length=1, default='0')

    def __unicode__(self):
        return '%s, Titulo:  %s' % (self.cod_docente, self.titulo_obtenido)


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
    estado = models.CharField(max_length=1, default='0')
    descuento = models.IntegerField()

    def __unicode__(self):
        return '%s, Institucion:  %s' % (self.cod_docente, self.institucion)


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
    estado = models.CharField(max_length=1, default='0')
    descripcion = models.TextField(max_length=500)

    def __unicode__(self):
        return '%s, Publicacion:  %s' % (self.cod_docente, self.nombre)
