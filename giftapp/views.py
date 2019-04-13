# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import clips
import json

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from gift_app import settings


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
    response = []
    if result:
        response = prepare_response(result)
    return JsonResponse(response, safe=False)


def match_preference(data):
    # Preference
    preference = '(preference ' + \
                 '(sex "' + data['sex'] + '") ' + \
                 '(price-level "' + data['priceLevel'] + '") ' + \
                 '(age-level "' + data['ageLevel'] + '"))'

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
    for gift in data.split(':'):
        if "," in gift:
            val = gift.split(',')
            response.append({"id": val[0], "name": val[1], "sex": val[2],
                             "age-level": val[3], "price-level": val[4]
                             })
    return response
