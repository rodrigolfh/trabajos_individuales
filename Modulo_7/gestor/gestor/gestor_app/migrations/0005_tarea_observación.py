# Generated by Django 4.2.2 on 2023-07-03 22:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestor_app', '0004_tarea_vencimiento_fecha_tarea_vencimiento_hora_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='tarea',
            name='observación',
            field=models.CharField(max_length=1024, null=True),
        ),
    ]
