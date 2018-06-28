from django.db import models

# Create your models here.
class plateLayout(models.Model):
    '''
    this is a list of standard layouts, referred to
    by plateKey.  By giving this name, we can get teh key from plateKey
    '''
    name = models.CharField(max_length = 100)

    def __str__(self):
        return self.name

class compound(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class species(models.Model):
    name = models.CharField(max_length = 100)

    def __str__(self):
        return self.name

class genotype(models.Model):
    species = models.ForeignKey('species', models.CASCADE)
    long_name = models.CharField(max_length = 100)
    short_name = models.CharField(max_length = 1)

    def __str__(self):
        return self.long_name

class plateKey(models.Model):
    '''
    this will be a large table which will expand plateLayout
    '''
    layout = models.ForeignKey('plateLayout', models.CASCADE)
    rowchoices = (
        ('A','A'),
        ('B','B'),
        ('C','C'),
        ('D','D'),
        ('E','E'),
        ('F','F'),
        ('G','G'),
        ('H','H'),
    )
    row = models.CharField(max_length = 1, choices= rowchoices)
    column = models.PositiveIntegerField()
    compound = models.ForeignKey('compound', models.CASCADE)
    concentration = models.FloatField(null=True)
