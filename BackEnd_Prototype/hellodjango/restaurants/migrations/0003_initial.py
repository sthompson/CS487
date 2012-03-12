# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Restaurant'
        db.create_table('restaurants_restaurant', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('delivery', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('logoURL', self.gf('django.db.models.fields.CharField')(max_length=200)),
        ))
        db.send_create_signal('restaurants', ['Restaurant'])

        # Adding model 'Food_Item'
        db.create_table('restaurants_food_item', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('itemURL', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('price', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal('restaurants', ['Food_Item'])

        # Adding model 'Menu'
        db.create_table('restaurants_menu', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('restaurant', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['restaurants.Restaurant'])),
            ('food_item', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['restaurants.Food_Item'])),
        ))
        db.send_create_signal('restaurants', ['Menu'])


    def backwards(self, orm):
        
        # Deleting model 'Restaurant'
        db.delete_table('restaurants_restaurant')

        # Deleting model 'Food_Item'
        db.delete_table('restaurants_food_item')

        # Deleting model 'Menu'
        db.delete_table('restaurants_menu')


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
