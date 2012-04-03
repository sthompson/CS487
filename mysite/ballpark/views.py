from django.http import HttpResponse
from django.utils import simplejson
from mysite.ballpark.models import*
from django.db.models import Max

def stadium(request):
    stadium = list(Stadium.objects.values())
    return HttpResponse(simplejson.dumps(stadium))

def restaurant(request):
    restaurant = list(Restaurants.objects.values('restaurant_name').filter(stadium_name__exact= request.POST.__getitem__('stadium_name')))
    return HttpResponse(simplejson.dumps(restaurant))

def menu_item(request):
    menu_item = list(Menu_items.objects.values('item_name', 'item_type','item_price').filter(restaurant_name__exact= request.POST.__getitem__('restaurant_name')))
    for item in menu_item:
        item['item_price'] = str(item['item_price'])
    return HttpResponse(simplejson.dumps(menu_item))

def extra_item(request):
    extra_item = list(Extra_items.objects.values('extra_name', 'extra_price').filter(restaurant_name__exact= request.POST.__getitem__('restaurant_name')))
    for item in extra_item:
        item['extra_price'] = str(item['extra_price'])
    return HttpResponse(simplejson.dumps(extra_item))

def order_status_retrieval(request):
    order_status = list(Order_status.objects.values('order_status_description','seat_num').filter(order_num__exact= request.POST.__getitem__('order_num')))
    return HttpResponse(simplejson.dumps(order_status))

def order_status_change(request):
    return HttpResponse(str(Order_status.objects.filter(order_num__exact= request.POST.__getitem__('order_num')).update(order_status_description=request.POST.__getitem__('new_status'))) + ' row(s) affected')

def order_submission(request):
    seat = request.POST.getlist('seat_num')[0]
    Order_status.objects.create(order_status_description_id='Cooking', seat_num = seat)
    new_order_num = Order_status.objects.all().aggregate(Max('order_num'))['order_num__max']
    post_items = request.POST.lists()
    restaurant = request.POST.getlist('restaurant_name')[0]
    for item in post_items:
        if(item[0]!= 'restaurant_name' and item[0]!='seat_num'):
            arr = item[0].split(',')
            menuitem = arr[1]
            quantity = arr[0]
            menu_item_price = Menu_items.objects.get(restaurant_name=restaurant, item_name=menuitem).item_price
            extra_items = item[1]
            for extra in extra_items:
                extra_item_price = Extra_items.objects.get(restaurant_name=restaurant, extra_name=extra).extra_price
                Orders.objects.create(order_num_id=new_order_num,restaurant_name_id=restaurant,item_name=menuitem, item_price=menu_item_price, item_quantity=quantity,extra_name=extra,extra_price=extra_item_price)
    return HttpResponse('Successfully submitted')

def order_retrieval(request):
    order = list(Orders.objects.values('order_num','item_name','item_quantity','extra_name'))
    return HttpResponse(simplejson.dumps(order))