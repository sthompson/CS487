from django.http import HttpResponse
from django.core import serializers
from django.utils import simplejson
from mysite.ballpark.models import* 

def stadium(request):
   data = serializers.serialize("json",Stadium.objects.all())
   return HttpResponse(data)

def restaurant(request):
   data = serializers.serialize("json",Restaurants.objects.all())
   return HttpResponse(data)

def menu_item(request):
   data = serializers.serialize("json",Menu_items.objects.all())
   return HttpResponse(data)
