from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('addCompound/', views.addCompound, name='addCompound'),
    path('compounds/', views.showCompounds, name='showCompounds'),
    path('compounds/removeCompound/<compoundID>/', views.removeCompound, name='removeCompound'),
    path('addExperiment/', views.addExperiment, name='addExperiment'),
    path('addMovie/', views.addMovie, name='addMovie'),
    path('experiments/', views.showExperiments, name='showExperiments'),
    path('experiments/removeExperiment/<experimentID>/', views.removeExperiment, name='removeExperiment'),
]
