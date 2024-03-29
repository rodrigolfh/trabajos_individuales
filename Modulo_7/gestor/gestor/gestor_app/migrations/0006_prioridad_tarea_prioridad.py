# Generated by Django 4.2.2 on 2023-07-22 02:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gestor_app', '0005_tarea_observación'),
    ]

    operations = [
        migrations.CreateModel(
            name='Prioridad',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(choices=[('A', 'Alta'), ('M', 'Media'), ('B', 'Baja')], default='Baja', max_length=1, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='tarea',
            name='prioridad',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='gestor_app.prioridad'),
        ),
    ]
