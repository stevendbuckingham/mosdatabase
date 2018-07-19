from django import forms

'''
here we will have the forms for entry and analysis
'''

# add conditions

class analyzePlate(forms.Form):
    from mosdb.models import compound, genotype, experiment, measurementMethod
    Experimenter = forms.CharField(max_length=100, required = False)
    Experiment = forms.ModelChoiceField(
        queryset = experiment.objects.all()
    )
    movieFile = forms.FilePathField(path = '/')
    Exposure_time = forms.IntegerField(min_value = 0, required = False)
    Compound = forms.ModelChoiceField(
        queryset = compound.objects.all(),
        required = False,
    )
    genotype_or_species = forms.ModelChoiceField(
        queryset = genotype.objects.all(),
        required = False,
    )
    measurement_method = forms.ModelChoiceField(
        queryset = measurementMethod.objects.all(),
    )

class addExperiment(forms.Form):
    experiment_name = forms.CharField(max_length=200, min_length = 1)
    experiment_date = forms.DateField(
        widget = forms.widgets.DateInput(
            attrs = {
                'type':'date',
            }
        )
    )
    conditions = forms.FilePathField(path = '.')

class addCompound(forms.Form):
    compound_name = forms.CharField(max_length = 300, min_length = 1)

class addMovie(forms.Form):
    from mosdb.models import experiment
    label = 'Add a movie to analyse'
    label2 = 'You must attach this to an experiment'
    movie = forms.CharField(max_length = 500, min_length = 1)
    drug_exposure = forms.IntegerField(min_value = 0,required=False)
    replicate = forms.IntegerField(min_value = 1,required=False)
    experiment = forms.ModelChoiceField(
        queryset = experiment.objects.all(),
    )
