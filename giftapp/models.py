from __future__ import unicode_literals

from django.db import models


class Suggestion(models.Model):
    giftName = models.CharField(max_length=50)
    giftId = models.IntegerField()
    attribute = models.CharField(max_length=50)
    value = models.CharField(max_length=50)
    quantity = models.IntegerField()

    def __str__(self):
        return 'ID: ' + str(self.id) + '\n' + \
               'gift-name: ' + self.giftName + '\n' + \
               'gift-id: ' + str(self.giftId) + '\n' + \
               'attribute: ' + self.attribute + '\n' + \
               'value: ' + self.value + '\n' + \
               'quantity: ' + str(self.quantity) + '\n'
