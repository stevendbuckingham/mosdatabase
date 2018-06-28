from django.contrib import admin

from mosdb.models import plateLayout, compound, genotype, species, experiment, movieFile

# Register your models here.

admin.site.register(plateLayout)
admin.site.register(compound)
admin.site.register(genotype)
admin.site.register(species)
admin.site.register(experiment)
admin.site.register(movieFile)
