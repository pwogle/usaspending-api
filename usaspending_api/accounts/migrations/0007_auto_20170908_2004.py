# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-08 20:04
from __future__ import unicode_literals

from django.db import migrations

from usaspending_api.common.helpers import FY_FROM_TEXT_PG_FUNCTION_DEF


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20170629_2045'),
    ]

    operations = [
        migrations.RunSQL(FY_FROM_TEXT_PG_FUNCTION_DEF),
    ]
