# Generated by Django 2.0.7 on 2018-07-19 15:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='compound',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='experiment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('date', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='genotype',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('long_name', models.CharField(max_length=100)),
                ('short_name', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='measurement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('readout', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='measurementMethod',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('script', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='movieFile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exposure', models.PositiveIntegerField()),
                ('replicate', models.PositiveIntegerField()),
                ('filename', models.CharField(max_length=500)),
                ('experiment', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.experiment')),
            ],
        ),
        migrations.CreateModel(
            name='plateKey',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('row', models.CharField(choices=[('A', 'A'), ('B', 'B'), ('C', 'C'), ('D', 'D'), ('E', 'E'), ('F', 'F'), ('G', 'G'), ('H', 'H')], max_length=1)),
                ('column', models.PositiveIntegerField()),
                ('concentration', models.FloatField(null=True)),
                ('compound', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.compound')),
                ('experiment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mosdb.experiment')),
                ('genotype', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.genotype')),
            ],
        ),
        migrations.CreateModel(
            name='species',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.AddField(
            model_name='measurement',
            name='measurementMethod',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.measurementMethod'),
        ),
        migrations.AddField(
            model_name='measurement',
            name='platekeyvalue',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.plateKey'),
        ),
        migrations.AddField(
            model_name='genotype',
            name='species',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mosdb.species'),
        ),
    ]
