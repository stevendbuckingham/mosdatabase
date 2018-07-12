def enterExperiments():
    from mosdb.models import experiment, plateLayout, plateKey, movieFile, compound, genotype
    import glob, pandas as pd, re
    from django.utils import timezone

    files = glob.glob('/media/steven/Ca_Backup/mosquito/1[6,7]*/*/*tif')
    choices = ['A','B','C','D','E','F','G','H']

    experiment.objects.all().delete()
    plateLayout.objects.all().delete()
    plateKey.objects.all().delete()
    movieFile.objects.all().delete()

    good=[]
    bad = []
    for f in files:
        try:
            print('{}'.format(f))
            expt = f.split('/')[5]
            if not plateLayout.objects.filter(name=expt):
                dmp = plateLayout()
                dmp.name = expt
                dmp.save()
            else:
                dmp = plateLayout.objects.get(name = expt)
            if not experiment.objects.filter(name = expt):
                x = experiment()
                x.name = expt
                x.date = timezone.datetime(int(expt[:2]), int(expt[2:4]), int(expt[4:6]))
                x.plateLayout = dmp
                x.save()
            else:
                x = experiment.objects.get(name = expt)
            conditions = pd.read_csv('/media/steven/Ca_Backup/mosquito/{}/conditions.csv'.format(expt))
            readkey(dmp, conditions)
            m = movieFile()
            m.experiment = x
            m.exposure = guess_exposure(f)
            m.replicate = guess_replicate(f)
            m.filename = f
            m.save()

            good.append(dmp.name)
        except:
            bad.append(dmp.name)
    return {'good': good,
        'bad': bad}

def readkey(dmp, conditions):
    from mosdb.models import plateKey, compound, genotype
    choices = ['A','B','C','D','E','F','G','H']
    for i,thisrow in conditions.iterrows():
        k = plateKey()
        k.layout = dmp
        k.column = thisrow['col']
        k.row = choices[thisrow['row']]
        k.compound = compound.objects.get(name=thisrow['cmpd'])
        k.concentration = thisrow['conc']
        k.genotype = genotype.objects.get(short_name = thisrow['genotype'])
        k.save()

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
