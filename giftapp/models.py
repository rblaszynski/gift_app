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
