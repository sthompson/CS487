from django.contrib import admin
from mysite.ballpark.models import*

class OrderStatusAdmin(admin.ModelAdmin):
    list_display = ('order_number','order_status_description','date_of_order','restaurant', 'customer')
    fields = ('restaurant', 'seat_number', 'order_status_description')
    ordering = ('restaurant','date_of_order', 'order_number')
    list_filter = ('restaurant','date_of_order', 'order_status_description')

class RestaurantAdmin(admin.ModelAdmin):
    list_display = ('restaurant_name', 'stadium_name')
    fields = ('restaurant_name', 'stadium_name', 'delivery_fee', 'logo_url')
    ordering = ('stadium_name','restaurant_name')
    list_filter = ('stadium_name',)

class MenuItemAdmin(admin.ModelAdmin):
    list_display = ('item_name', 'item_type', 'restaurant')
    ordering = ('restaurant','item_type', 'item_name')
    list_filter = ('restaurant', 'item_type')

class ExtraItemAdmin(admin.ModelAdmin):
    list_display = ('extra_name', 'restaurant')
    ordering = ('restaurant','extra_name')
    list_filter = ('restaurant',)

class StadiumAdmin(admin.ModelAdmin):
    list_display = ('stadium_name','latitude','longitude')
    fields = ('stadium_name', 'latitude', 'longitude')
    ordering = ['stadium_name']

"""
class ItemTypeAdmin(admin.ModelAdmin):
    list_display = ['item_type']
    ordering = ['item_type']

class StatusDescriptionAdmin(admin.ModelAdmin):
    list_display = ['order_status_description']
    ordering = ['order_status_description']
"""

class OrderAdmin(admin.ModelAdmin):
    list_display = ('order_number','item_number','item_name','item_quantity','customer')
    ordering = ('order_number','item_number', 'item_name', 'item_quantity')
    fields = ('order_number', 'item_name', 'item_price', 'item_quantity')
    list_filter = ('order_number__restaurant', 'order_number__date_of_order', 'order_number__order_number')

class OrderExtraAdmin(admin.ModelAdmin):
    list_display = ('order_number','extra_name', 'customer')
    ordering = ('order_number','extra_name')
    list_filter = ('order_number__order_number__restaurant','order_number__order_number__date_of_order', 'order_number__order_number__order_number')

class CustomerAdmin(admin.ModelAdmin):
    list_display = ('username','password','seat_number')
    ordering = ['username']

class CartAdmin(admin.ModelAdmin):
    list_display = ('customer','restaurant','item_name', 'item_quantity')
    ordering = ('username',)
      
class CartExtraAdmin(admin.ModelAdmin):
    list_display = ('customer','cart_item','extra_name')
    ordering = ('cart_item',)

admin.site.register(Stadium, StadiumAdmin)
admin.site.register(Restaurant, RestaurantAdmin)
#admin.site.register(Item_type, ItemTypeAdmin)
admin.site.register(Menu_item, MenuItemAdmin)
admin.site.register(Extra_item, ExtraItemAdmin)
#admin.site.register(Status_description, StatusDescriptionAdmin)
admin.site.register(Order_status,OrderStatusAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(Order_extra,OrderExtraAdmin)
admin.site.register(Customer,CustomerAdmin)
admin.site.register(Cart,CartAdmin)
admin.site.register(Cart_extra,CartExtraAdmin)
