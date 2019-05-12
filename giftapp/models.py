# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


# Create your models here.
class Gift(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    age = models.CharField(max_length=50)
    sex = models.CharField(max_length=50)
    price = models.CharField(max_length=50)

    def __str__(self):
        return 'ID: ' + str(self.id) + '\n' + \
               'name: ' + self.name + '\n' + \
               'description: ' + self.description + '\n' + \
               'age: ' + self.age + '\n' + \
               'sex: ' + self.sex + '\n' + \
               'price: ' + self.price + '\n'


class Suggestion(models.Model):
    giftName = models.CharField(max_length=50)
    giftId = models.IntegerField()
    attribute = models.CharField(max_length=50)
    value = models.CharField(max_length=50)
    quantity = models.IntegerField()

    def __str__(self):
        return 'ID: '+ str(self.id) + '\n' +\
            'gift-name: ' + self.giftName + '\n' +\
            'gift-id: ' + str(self.giftId) + '\n' +\
            'attribute: ' + self.attribute + '\n' +\
            'value: ' + self.value + '\n' +\
            'quantity: ' + str(self.quantity) + '\n'