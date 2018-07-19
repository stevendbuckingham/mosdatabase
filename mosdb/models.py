from django.db import models

# Create your models here.
# class plateLayout(models.Model):
#     '''
#     this is a list of standard layouts, referred to
#     by plateKey.  By giving this name, we can get teh key from plateKey
#     '''
#     name = models.CharField(max_length = 100)

#     def __str__(self):
#         return self.name

class plateKey(models.Model):
    '''
    this will be a large table which will expand plateLayout
    '''
    row = models.CharField(max_length = 1)
    column = models.PositiveIntegerField()
    compound = models.ForeignKey('compound', models.CASCADE, null = True)
    genotype = models.ForeignKey('genotype', models.CASCADE, null = True)
    concentration = models.FloatField(null=True)
    experiment = models.ForeignKey('experiment', models.CASCADE)

class compound(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class species(models.Model):
    name = models.CharField(max_length = 100)

    def __str__(self):
        return self.name

class genotype(models.Model):
    species = models.ForeignKey('species', models.CASCADE, null = True)
    long_name = models.CharField(max_length = 100)
    short_name = models.CharField(max_length = 1)

    def __str__(self):
        return self.long_name

class experiment(models.Model):
    name = models.CharField(max_length = 100)
    date = models.DateField()
    #plateLayout = models.ForeignKey('plateLayout', models.CASCADE, null = True)

    def __str__(self):
        return self.name

class movieFile(models.Model):
    experiment = models.ForeignKey('experiment', models.CASCADE, null = True)
    exposure = models.PositiveIntegerField()
    replicate = models.PositiveIntegerField()
    filename = models.CharField(max_length=500)

    def __str__(self):
        return self.filename

class measurement(models.Model):
    platekeyvalue = models.ForeignKey('plateKey', models.CASCADE, null = True)
    measurementMethod = models.ForeignKey('measurementMethod', models.CASCADE, null=True)
    readout = models.FloatField()

class measurementMethod(models.Model):
    name = models.CharField(max_length = 100)
    script = models.TextField()
