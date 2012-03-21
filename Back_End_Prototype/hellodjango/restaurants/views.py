# Create your views here.
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core import serializers
from django.utils import simplejson
from hellodjango.restaurants.models import Restaurant
from hellodjango.restaurants.models import Menu 
from hellodjango.restaurants.models import Food_Item 

def json(request):
   data = serializers.serialize("json",Restaurant.objects.all())
   return HttpResponse(data)

def restaurants(request):
   data = serializers.serialize("python",Restaurant.objects.all())
   actual_data = [d["fields"] for d in data]
   #actual_data = serializers.serialize("json",Restaurant.objects.all())
   return HttpResponse(simplejson.dumps(actual_data))

def menu(request,res_name): 
   restaurant = serializers.serialize("python",Restaurant.objects.filter(name=res_name))
   res_id = restaurant[0]["pk"]
   menu = serializers.serialize("python",Menu.objects.filter(restaurant=res_id))
   food_ids = [d["fields"]["food_item"] for d in menu]
   food_items = serializers.serialize("python",Food_Item.objects.all())
   my_items = [d["fields"]["name"] for d in food_items if d["pk"] in food_ids]
   return HttpResponse(simplejson.dumps(my_items))

def fooditem(request,food_name):
  # food_items = serializers.serialize("python",Food_Item.objects.filter(name=food_name))
  # actual_food_items= [d["fields"] for d in food_items]
  # return HttpResponse(simplejson.dumps(actual_food_items))
   food_item = serializers.serialize("python",Food_Item.objects.filter(name=food_name))
   actual_food_item = food_item[0]["fields"]
   return HttpResponse(simplejson.dumps(actual_food_item))

   
   
   





