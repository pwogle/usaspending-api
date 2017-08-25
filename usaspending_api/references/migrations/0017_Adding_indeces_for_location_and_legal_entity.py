# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-08-14 18:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('references', '0016_adding indexes to Location'),
    ]

    operations = [
        migrations.AlterField(
            model_name='legalentity',
            name='legal_entity_id',
            field=models.AutoField(db_index=True, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='location',
            name='zip4',
            field=models.TextField(blank=True, db_index=True, null=True, verbose_name='ZIP+4'),
        ),
    ]