# Generated by Django 2.2.13 on 2020-07-27 19:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('references', '0048_drop_old_gtas'),
    ]

    operations = [
        migrations.AddField(
            model_name='gtassf133balances',
            name='total_budgetary_resources_cpe',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=23),
            preserve_default=False,
        ),
    ]