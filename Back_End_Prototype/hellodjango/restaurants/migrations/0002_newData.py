# encoding: utf-8
import datetime
from south.db import db
from south.v2 import DataMigration
from django.db import models

class Migration(DataMigration):

    def forwards(self, orm):
      for res in orm.Restaurant.objects.all():
         if res.name == "McDonald":
            res.name = "McDonalds"
            res.save()


    def backwards(self, orm):
        "Write your backwards methods here."


    models = {
        'restaurants.food_item': {
            'Meta': {'object_name': 'Food_Item'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'itemURL': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'price': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        'restaurants.menu': {
            'Meta': {'object_name': 'Menu'},
            'food_item': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['restaurants.Food_Item']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'restaurant': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['restaurants.Restaurant']"})
        },
        'restaurants.restaurant': {
            'Meta': {'object_name': 'Restaurant'},
            'delivery': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logoURL': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['restaurants']
