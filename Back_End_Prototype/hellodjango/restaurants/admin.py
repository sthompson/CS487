from django.contrib import admin
from hellodjango.restaurants.models import Restaurant, Food_Item, Menu

admin.site.register(Restaurant)
admin.site.register(Food_Item)
admin.site.register(Menu)
