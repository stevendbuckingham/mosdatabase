import django, os
import numpy as np
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mosquito.settings")

django.setup()
from mosdb.models import *
import hypothesis
from hypothesis import given
from hypothesis.extra.django.models import models
from hypothesis.strategies import text, from_regex, integers, floats
from hypothesis.extra.django import TestCase
import string
import pytest


@pytest.mark.django_db
class testPlateLayout(TestCase):
    @given(
        models(
            plateLayout,
            name = text(alphabet = string.printable,
                max_size = 100)
        )
    )
    
    def test_plate_layout(self, s):
        self.assertIsNotNone(s),


class testPlateKey(TestCase):
    @given(
        models(
            plateKey,
            layout = models(
                plateLayout,
                name = text(alphabet = string.printable),
            ),
            row = text(
                        alphabet = string.ascii_letters, 
                        min_size=1, 
                        max_size = 1
                    ),
            column = integers(max_value = 11, min_value = 0),
            compound = models(
                compound,
                name = text(alphabet = string.printable, 
                    min_size=1,
                    max_size = 100,
                ),
            ),
            genotype = models(
                genotype,
                species = models(
                    species,
                    name = text(
                            alphabet = string.printable,
                            max_size = 100,
                        ),
                ),
                long_name = text(
                        alphabet = string.printable, 
                        max_size=100
                        ),
                short_name = text(
                        alphabet = string.printable, 
                        max_size=1),
            ),
            concentration = floats(min_value = 0, max_value = 1),
        )
    )

    def test_testplatekey(self, k):
        self.assertIsNotNone(k)
        self.assertTrue(k.concentration>-1)
        self.assertTrue(k.column > -1)
        self.assertTrue(k.column<12)
        self.assertTrue(len(k.compound.name)>0)

moviefile = models(
        movieFile,
        experiment = models(
            experiment,
            name = text(
                alphabet = string.printable,
                max_size = 100,
            ),
            plateLayout = models(
                plateLayout,
                name = text(
                    alphabet = string.printable,
                    max_size = 100,
                )
            ),
        ),
        exposure = integers(min_value= 0),
        replicate = integers(min_value = 0),
        filename = text(
            alphabet = string.printable,
            max_size = 500,
        ),
    )


class movieFile(TestCase):
    @given(
        moviefile
    )

    def test_moviefile(self, mov):
        self.assertIsNotNone(mov)
        self.assertIsNotNone(mov.experiment)
        self.assertIsNotNone(mov.experiment.date)
        self.assertIsNotNone(mov.experiment.plateLayout)
        self.assertIsNotNone(mov.exposure)
        self.assertIsNotNone(mov.replicate)
        self.assertIsNotNone(mov.filename)
        self.assertFalse(mov.exposure<0)
        self.assertTrue(np.isfinite(mov.exposure))
        
class testMeasurement(TestCase):

    @given(
        models(
            measurement,
            movie_file = moviefile,
            measurementMethod = models(
                measurementMethod,
                name = text(
                    alphabet = string.printable,
                    max_size = 100,
                ),
                script = text(
                    alphabet = string.printable,
                ),
            ),
            readout = floats(min_value= 0, max_value = 1e10),
        )
    )
    
    def test_measurement(self, meas):
        self.assertIsNotNone(meas)