

def addNewCompounds(conditions):
    import numpy as np
    from mosdb.models import compound
    compoundsInConditions = np.unique(conditions['cmpd'])
    for thisCompound in compoundsInConditions:
        if not compound.objects.filter(name = thisCompound.upper()):
            compound.objects.create(name = thisCompound.upper())


def readkey(conditions, movieFile):
    from mosdb.models import plateKey, compound, genotype
    choices = ['A','B','C','D','E','F','G','H']
    for i,thisrow in conditions.iterrows():
        k = plateKey()
        k.column = thisrow['col']
        k.row = choices[thisrow['row']]
        k.compound = compound.objects.get(name=thisrow['cmpd'])
        k.concentration = thisrow['conc']
        k.genotype = genotype.objects.get(short_name = thisrow['genotype'])
        k.save()
        movieFile.platekey.add(k)
    movieFile.save()

def guess_exposure(filename):
    import re
    s = re.compile('(\\d+) *min')
    if s.search(filename):
        exposure = int(s.search(filename).groups()[0])
    else:
        exposure = -1
    return int(exposure)

def guess_replicate(filename):
    import re
    replicate = -1
    s = re.compile('/*min .*(\\d)/')
    if s.search(filename):
        replicate = s.search(filename).groups()[0]
    return int(replicate)

from mosdb.models import experiment, plateKey, movieFile, compound, genotype
import glob, pandas as pd, re
from django.utils import timezone

files = glob.glob('/media/steven/Ca_Backup/mosquito/1[6,7]*/*/*tif')
choices = ['A','B','C','D','E','F','G','H']

experiment.objects.all().delete()
plateKey.objects.all().delete()
movieFile.objects.all().delete()

good=[]
bad = []
for f in files:
    try:
        print('{}'.format(f))
        expt = f.split('/')[5]
        # if not plateLayout.objects.filter(name=expt):
        #     dmp = plateLayout()
        #     dmp.name = expt
        #     dmp.save()
        # else:
        #     dmp = plateLayout.objects.get(name = expt)
        if not experiment.objects.filter(name = expt):
            x = experiment()
            x.name = expt
            x.date = timezone.datetime(int(expt[:2]), int(expt[2:4]), int(expt[4:6]))
            # x.plateLayout = dmp
            x.save()
        else:
            x = experiment.objects.get(name = expt)
        conditions = pd.read_csv('/media/steven/Ca_Backup/mosquito/{}/conditions.csv'.format(expt))
        addNewCompounds(conditions)
        m = movieFile()
        m.experiment = x
        m.exposure = guess_exposure(f)
        m.replicate = guess_replicate(f)
        m.filename = f
        m.save()
        readkey(conditions, m)

        good.append(f)
    except:
        bad.append(f)
