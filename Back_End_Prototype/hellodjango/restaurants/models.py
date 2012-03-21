from django.db import models

class Restaurant(models.Model):
   name = models.CharField(max_length=100)
   delivery = models.CharField(max_length=30)
   logoURL = models.CharField(max_length=200)
   
   def __unicode__(self):
      return self.name

class Food_Item(models.Model):
   name = models.CharField(max_length=100)
   itemURL = models.CharField(max_length=200)
   price = models.CharField(max_length=20)

   def __unicode__(self):
      return self.name

class Menu(models.Model):
   restaurant = models.ForeignKey(Restaurant)
   food_item = models.ForeignKey(Food_Item) 

   def __unicode__(self):
      return self.restaurant.name + " " + self.food_item.name
