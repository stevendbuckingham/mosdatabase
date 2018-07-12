from django.contrib import admin

from mosdb.models import compound, genotype, species, experiment, movieFile
from mosdb.models import plateKey, measurement, measurementMethod
# Register your models here.

admin.site.register(compound)
admin.site.register(genotype)
admin.site.register(species)
admin.site.register(experiment)
admin.site.register(movieFile)
admin.site.register(plateKey)
admin.site.register(measurement)
admin.site.register(measurementMethod)

