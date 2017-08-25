# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2017-06-29 20:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0005_federalaccount_federal_account_code'),
    ]

    operations = [
        migrations.CreateModel(
            name='BudgetAuthority',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('agency_identifier', models.TextField(db_index=True)),
                ('fr_entity_code', models.TextField(db_index=True, null=True)),
                ('year', models.IntegerField()),
                ('amount', models.BigIntegerField(null=True)),
            ],
            options={
                'db_table': 'budget_authority',
            },
        ),
        migrations.AlterUniqueTogether(
            name='budgetauthority',
            unique_together=set([('agency_identifier', 'fr_entity_code', 'year')]),
        ),
    ]