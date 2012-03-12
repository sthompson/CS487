from django.shortcuts import render_to_response
from django.http import HttpResponse

def root(request):
   return render_to_response('base.html')

   
