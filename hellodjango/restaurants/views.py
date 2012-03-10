# Create your views here.
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core import serializers
from django.utils import simplejson
from hellodjango.restaurants.models import Restaurant
from hellodjango.restaurants.models import Menu 
from hellodjango.restaurants.models import Food_Item 

def json(request):
   data = serializers.serialize("python",Restaurant.objects.all())
   actual_data = [d["fields"] for d in data]
   return HttpResponse(simplejson.dumps(actual_data))

def restaurants(request):
   data = serializers.serialize("python",Restaurant.objects.all())
   actual_data = [d["fields"] for d in data]
   return HttpResponse(simplejson.dumps(actual_data))

def menu(request,res_name): 
   restaurant = serializers.serialize("python",Menu.objects.filter(name=res_name))
   data = serializers.serialize("python",Menu.objects.filter(name=res_name))
   actual_data = [d["fields"] for d in data]
   return HttpResponse(simplejson.dumps(actual_data))
   
   





