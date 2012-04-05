from django.http import HttpResponse
from django.utils import simplejson
from mysite.ballpark.models import*
from django.db.models import Max

def stadium(request):
    user_longitude = float(request.POST.__getitem__('longitude'))
    user_latitude = float(request.POST.__getitem__('latitude'))
    stadium = list(Stadium.objects.values().filter(longitude__range=(user_longitude-.3, user_longitude+.3), latitude__range=(user_latitude-.3, user_latitude+.3)))
    for item in stadium:
        item['longitude'] = str(item['longitude'])
        item['latitude'] = str(item['latitude'])
    return HttpResponse(simplejson.dumps(stadium))

def restaurant(request):
    restaurant = list(Restaurant.objects.values('restaurant_name', 'delivery_fee', 'logo_url').filter(stadium_name__exact= request.POST.__getitem__('stadium_name')))
    for item in restaurant:
        item['delivery_fee'] = str(item['delivery_fee'])
    return HttpResponse(simplejson.dumps(restaurant))

def menu_item(request):
    restaurantPK = Restaurant.objects.get(stadium_name__exact= request.POST.__getitem__('stadium_name'), restaurant_name__exact= request.POST.__getitem__('restaurant_name')).pk
    menu_item = list(Menu_item.objects.values('item_name', 'item_type','item_price','picture_url').filter(restaurant= restaurantPK))
    for item in menu_item:
        item['item_price'] = str(item['item_price'])
    return HttpResponse(simplejson.dumps(menu_item))

def extra_item(request):
    restaurantPK = Restaurant.objects.get(stadium_name__exact= request.POST.__getitem__('stadium_name'), restaurant_name__exact= request.POST.__getitem__('restaurant_name')).pk
    extra_item = list(Extra_item.objects.values('extra_name', 'extra_price').filter(restaurant= restaurantPK))
    for item in extra_item:
        item['extra_price'] = str(item['extra_price'])
    return HttpResponse(simplejson.dumps(extra_item))

def order_status_retrieval(request):
    transaction = list(Order_status.objects.values('transaction_number','order_number','order_status_description','seat_number').filter(transaction_number__exact= request.POST.__getitem__('transaction_number')))
    return HttpResponse(simplejson.dumps(transaction))

def order_submission(request):
    seat = request.POST.__getitem__('seat_number')
    restaurantPK = Restaurant.objects.get(stadium_name__exact= request.POST.__getitem__('stadium_name'), restaurant_name__exact= request.POST.__getitem__('restaurant_name')).pk
    Order_status.objects.create(seat_number = seat, restaurant_id=restaurantPK)
    new_transaction_number = Order_status.objects.all().aggregate(Max('transaction_number'))['transaction_number__max']
    post_items = request.POST.lists()
    for item in post_items:
        if(item[0]!= 'restaurant_name' and item[0]!='seat_number' and item[0]!='stadium_name'):
            arr = item[0].split(',')
            menuitem = arr[0]
            quantity = arr[1]
            menu_item_price = Menu_item.objects.get(restaurant=restaurantPK, item_name=menuitem).item_price
            for same_item_name in item[1]:
                extra_items = same_item_name.split(',')
                Order.objects.create(order_number_id=new_transaction_number,item_name=menuitem, item_price=menu_item_price, item_quantity=quantity)
                ordernumber = Order.objects.all().aggregate(Max('pk'))['pk__max']
                for extra in extra_items:
                    if len(extra) != 0:
                        extra_item_price = Extra_item.objects.get(restaurant=restaurantPK, extra_name=extra).extra_price
                        Order_extra.objects.create(order_number_id=ordernumber,extra_name=extra,extra_price=extra_item_price)
    return HttpResponse(new_transaction_number)

def payment_verification(request):
    cc_name = request.POST.__getitem__('cc_name')
    cc_number = request.POST.__getitem__('cc_number')
    cc_exp_month = request.POST.__getitem__('cc_exp_month')
    cc_exp_year = request.POST.__getitem__('cc_exp_year')
    return HttpResponse('pass')