# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2017-06-13 15:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('curriculo_vitae', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='distincion',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='docente_idioma',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='estudio',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='experiencia',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='formacion_continua',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='investigacion',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='estado',
            field=models.CharField(default='0', max_length=1),
        ),
    ]
