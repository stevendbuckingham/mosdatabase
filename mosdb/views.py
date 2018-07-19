from django.shortcuts import render
import pdb



# Create your views here.
def index(request):
    return render(request, 'index.html', {})

def addCompound(request):
    from mosdb.forms import addCompound
    from mosdb.models import compound

    if request.method == 'POST':
        form = addCompound(request.POST)
        if form.is_valid():
            # get all the variables
            newCompound = form.cleaned_data['compound_name'].upper()
            if not compound.objects.filter(name=newCompound):
                compound.objects.create(name = newCompound)
                context = {
                    'message': 'The compound {} was added to the database'.format(newCompound),
                }
            else:
                context = {
                    'message': 'This compound ({}) is already in the database'.format(newCompound),
                }
            return render(request, 'messages.html', context)

    form = addCompound()
    context = {
        'form': form,
    }
    return render(request, 'addCompound.html', context)

def showCompounds(request):
    '''
    show the user all the compunds in the database
    '''
    from mosdb.models import compound
    compounds = compound.objects.all()
    context = {
        'compounds': compounds,
    }
    return render(request, 'showCompounds.html', context)

def removeCompound(request, compoundID):
    from mosdb.models import compound
    if not compound.objects.filter(id = compoundID):
        context = {
            'message': 'That is strange - there was no such compound as {} in the database'.format(compound.name),
        }
        return render(request, 'messages.html', context)
    compound.objects.get(id = compoundID).delete()
    compounds = compound.objects.all()
    context = {
        'compounds': compounds,
    }
    return render(request, 'showCompounds.html', context)

def addExperiment(request):
    from mosdb.forms import addExperiment
    from mosdb.models import experiment, plateKey, compound, genotype
    from mosdb.helpers import addConditions as ac

    if request.method == 'POST':
        form = addExperiment(request.POST)
        if form.is_valid():
            experiment_name = form.cleaned_data['experiment_name']
            experiment_date = form.cleaned_data['experiment_date']
            conditions = form.cleaned_data['conditions']
            # handle the conditions file
            conditions = ac.importFromSpreadsheet(conditions)
            if experiment.objects.filter(name = experiment_name):
                context = {
                    'message': 'you already have an experiment of that name',
                }
                return render(request, 'messages.html', context)
            thisExpt = experiment.objects.create(
                name = experiment_name,
                date = experiment_date,
            )
            # add to the platekey collection and attach to the experiment
            try:
                for i,row in conditions.iterrows():
                    #pdb.set_trace()
                    plateKey.objects.create(
                            row = row['row'],
                            column = row['col'],
                            compound = compound.objects.get(name = row['cmpd']),
                            genotype = genotype.objects.get(short_name = row['genotype']),
                            concentration = row['conc'],
                            experiment = thisExpt,
                        )
            except:
                print('cant create conditions')

            context = {
                'message': 'experiment {} added OK'.format(experiment_name),
            }
            return render(request, 'messages.html', context)

    form = addExperiment()
    context = {
        'form': form,
    }
    return render(request, 'addExperiment.html', context)

def addMovie(request):
    from mosdb.forms import addMovie

    if request.method == 'POST':
        form = addMovie(request.POST)
        if form.is_valid():
            movieLocation = form.cleaned_data['movie']
            

    # get a movie filepath

def showExperiments(request):
    from mosdb.models import experiment

    experiments = experiment.objects.all()

    context = {
        'experiments': experiments,
    }

    return render(request, 'showExperiments.html', context)

def removeExperiment(request, experimentID):
    from mosdb.models import experiment

    experiment.objects.get(id = experimentID).delete()
    experiments = experiment.objects.all()
    context = {
        'experiments': experiments,
    }

    return render(request, 'showExperiments.html', context)
