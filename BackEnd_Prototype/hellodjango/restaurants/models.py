from django.db import models

class Restaurant(models.Model):
   name = models.CharField(max_length=100)
   delivery = models.CharField(max_length=30)
   logoURL = models.CharField(max_length=200)

class Food_Item(models.Model):
   name = models.CharField(max_length=100)
   itemURL = models.CharField(max_length=200)
   price = models.CharField(max_length=20)

class Menu(models.Model):
   restaurant = models.ForeignKey(Restaurant)
   food_item = models.ForeignKey(Food_Item) 
