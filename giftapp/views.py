# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os

import clips
import json

from django.http import JsonResponse, HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from gift_app import settings
from giftapp.models import Suggestion


def index(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def preferences(request):
    return render(request, 'preferences.html')


@csrf_exempt
def new_preference(request):
    # body = json.loads(request.POST)
    result = match_preference(request.POST)
    print result
    response = []
    if result:
        response = prepare_response(result)
    return JsonResponse(response, safe=False)


def match_preference(data):
    # Preference
    preference = '(preference ' + \
                 '(sex "' + data['sex'] + '") ' + \
                 '(price-level "' + data['priceLevel'] + '") ' + \
                 '(age-level "' + data['ageLevel'] + '") ' + \
                 '(cat-fashion "' + data['catFashion'] + '") ' + \
                 '(cat-music "' + data['catMusic'] + '") ' + \
                 '(cat-book "' + data['catBook'] + '") ' + \
                 '(cat-games "' + data['catGames'] + '") ' + \
                 '(cat-movies "' + data['catMovies'] + '") ' + \
                 '(cat-gadgets "' + data['catGadgets'] + '") ' + \
                 '(cat-sport "' + data['catSport'] + '") ' + \
                 '(cat-cosmetics "' + data['catCosmetics'] + '") ' + \
                 '(cat-toy "' + data['catToy'] + '"))'

    print(preference)
    clips.Clear()
    clips.BatchStar(settings.CLIPS_DIR + "/templates.clp")
    clips.BatchStar(settings.CLIPS_DIR + "/gifts.clp")
    clips.BatchStar(settings.CLIPS_DIR + "/suggestions.clp")
    clips.BatchStar(settings.CLIPS_DIR + "/rules.clp")
    clips.Reset()
    clips.Assert(preference)
    clips.Run()
    return clips.StdoutStream.Read()


def prepare_response(data):
    response = []
    print(data)
    for gift in data.split(':'):
        if "," in gift:
            val = gift.split(',')
            response.append({"id": val[0], "name": val[1]})
    return response

@csrf_exempt
def modify(request):
    insertSuggestionIntoDatabase(request.POST)
    insertSuggestionsIntoClips()
    return HttpResponse('')


def insertSuggestionIntoDatabase(data):
    attributeMap = {'sex': 'sex',
                    'priceLevel': 'price-level',
                    'ageLevel': 'age-level'}

    suggestion = Suggestion(
        giftName=data['giftName'],
        giftId=int(data['giftId']),
        attribute=attributeMap[data['key']],
        value=data['value'],
        quantity=0)

    suggestions = Suggestion.objects.filter(giftId=int(data['giftId']), attribute=attributeMap[data['key']],
                                            value=data['value'])
    if (len(suggestions) != 0):
        suggestion = suggestions[0]

    suggestion.quantity = suggestion.quantity + 1
    suggestion.save()
    print suggestion


def insertSuggestionsIntoClips():
    # check if a fact-file exists
    FactsFile = settings.CLIPS_DIR + "/suggestions.clp"
    if not os.path.isfile(FactsFile):
        file = open(FactsFile, 'w+')
        file.write("(deffacts suggestions)\n")
        file.close()

    # modify facts
    suggestions = Suggestion.objects.all()
    lines = ['(deffacts suggestions\n']
    for suggestion in suggestions:
        lines.append('  (suggestion '
                     '(gift-name "'+suggestion.giftName+'")'
                     '(gift-id '+str(suggestion.giftId)+')'
                     '(attribute "'+suggestion.attribute+'")'
                     '(value "'+suggestion.value+'")'
                     '(quantity '+str(suggestion.quantity)+'))\n')

    lines.append(')\n')

    # new facts
    open(FactsFile, 'w').writelines(lines)