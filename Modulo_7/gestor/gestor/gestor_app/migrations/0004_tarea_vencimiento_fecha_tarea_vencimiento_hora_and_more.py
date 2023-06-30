# Generated by Django 4.2.2 on 2023-06-30 01:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestor_app', '0003_remove_tarea_vencimiento'),
    ]

    operations = [
        migrations.AddField(
            model_name='tarea',
            name='vencimiento_fecha',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='tarea',
            name='vencimiento_hora',
            field=models.TimeField(null=True),
        ),
        migrations.AlterField(
            model_name='tarea',
            name='estado',
            field=models.CharField(choices=[('PENDIENTE', 'Pendiente'), ('EN PROGRESO', 'En Progreso'), ('COMPLETADA', 'Completada')], max_length=11),
        ),
    ]
