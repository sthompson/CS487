from django.http import HttpResponse
from django.utils import simplejson
from mysite.ballpark.models import*
from django.db.models import Max
from django.db.models import Sum

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
    status = list(Order_status.objects.values('order_number','order_status_description','restaurant_id', 'pk').filter(user__exact= request.POST.__getitem__('username')).exclude(order_status_description = 'Arrived'))
    for item in status:
        item['restaurant_name'] = Restaurant.objects.get(pk=item['restaurant_id']).restaurant_name
        item['total_price'] = 0
        cart = list(Order.objects.values('item_quantity', 'item_price', 'pk').filter(order_number__exact= item['pk']))
        for cart_item in cart:
            extraprice = Order_extra.objects.filter(order_number = cart_item['pk']).aggregate(Sum('extra_price')).values()[0]
            if extraprice != None:
                cart_item['item_price'] = cart_item['item_price'] + extraprice
                cart_item['item_price'] = cart_item['item_quantity']*cart_item['item_price']
            print cart_item['item_price']
            item['total_price'] = item['total_price'] + cart_item['item_price']
        item['total_price'] = str(item['total_price'])
        del item['pk']
        del item['restaurant_id']
    return HttpResponse(simplejson.dumps(status))

def order_submission(request):
    seat = Customer.objects.get(username__exact= request.POST.__getitem__('username')).seat_number
    restaurants_in_cart = list((Cart.objects.values('restaurant_id').filter(username__exact= request.POST.__getitem__('username'))).distinct())
    restaurantPKs = []
    for item in restaurants_in_cart:
        restaurantPKs.append(item.values()[0])
    for item in restaurantPKs:
        Order_status.objects.create(seat_number = seat, restaurant_id=item, user_id = request.POST.__getitem__('username'))
        new_transaction_number = Order_status.objects.all().aggregate(Max('transaction_number'))['transaction_number__max']
        cartitems = list(Cart.objects.values('item_name', 'item_quantity', 'item_price', 'has_extra', 'pk').filter(username__exact= request.POST.__getitem__('username'), restaurant = item))
        for item in cartitems:
            menuitem = item['item_name']
            quantity = item['item_quantity']
            menu_item_price = item['item_price']
            extra_items = list(Cart_extra.objects.values('extra_name', 'extra_price').filter(cart_item__exact= item['pk']))
            Order.objects.create(order_number_id=new_transaction_number,item_name=menuitem, item_price=menu_item_price, item_quantity=quantity)
            ordernumber = Order.objects.all().aggregate(Max('pk'))['pk__max']
            for extra in extra_items:
                Order_extra.objects.create(order_number_id=ordernumber,extra_name=extra['extra_name'],extra_price=extra['extra_price'])
    Cart.objects.filter(username__exact= request.POST.__getitem__('username')).delete()
    Customer.objects.filter(pk=request.POST.__getitem__('username')).update(seat_number = '')
    return HttpResponse()

def add_to_cart(request):
    user = request.POST.__getitem__('username')
    restaurantPK = Restaurant.objects.get(stadium_name__exact= request.POST.__getitem__('stadium_name'), restaurant_name__exact= request.POST.__getitem__('restaurant_name')).pk
    post_items = request.POST.lists()
    for item in post_items:
        if(item[0]!= 'restaurant_name' and item[0]!='username' and item[0]!='stadium_name'):
            arr = item[0].split(',')
            menuitem = arr[0]
            quantity = arr[1]
            menu_item_price = Menu_item.objects.get(restaurant=restaurantPK, item_name=menuitem).item_price
            extra_items = item[1][0].split(',')
            if len(extra_items[0]) != 0:
                Cart.objects.create(restaurant_id=restaurantPK,item_name=menuitem, item_price=menu_item_price, item_quantity=quantity, username_id=user, has_extra=1)
                cartitem = Cart.objects.all().aggregate(Max('pk'))['pk__max']
                for extra in extra_items:
                    if len(extra) != 0:
                        extra_item_price = Extra_item.objects.get(restaurant=restaurantPK, extra_name=extra).extra_price
                        Cart_extra.objects.create(cart_item_id=cartitem,extra_name=extra,extra_price=extra_item_price)
            else:
                Cart.objects.create(restaurant_id=restaurantPK,item_name=menuitem, item_price=menu_item_price, item_quantity=quantity, username_id=user)
    return HttpResponse()

def view_cart(request):
    cart = list(Cart.objects.values('has_extra', 'item_name', 'item_quantity', 'item_price', 'pk').filter(username__exact= request.POST.__getitem__('username')))
    for item in cart:
        extraprice = Cart_extra.objects.filter(cart_item = item['pk']).aggregate(Sum('extra_price')).values()[0]
        if extraprice != None:
            item['item_price'] = item['item_price'] + extraprice
        item['item_price'] = str(item['item_price'])
    return HttpResponse(simplejson.dumps(cart))

def empty_cart(request):
    Cart.objects.filter(username__exact= request.POST.__getitem__('username')).delete()
    return HttpResponse()

def delete_item(request):
    Cart.objects.filter(username__exact= request.POST.__getitem__('username'), pk__exact = request.POST.__getitem__('pk')).delete()
    return HttpResponse()

def create_username(request):
    user = request.POST.__getitem__('username')
    pw = request.POST.__getitem__('password')
    ccname = request.POST.__getitem__('cc_name')
    ccnumber = request.POST.__getitem__('cc_number')
    ccexpmonth = request.POST.__getitem__('cc_exp_month')
    ccexpyear = request.POST.__getitem__('cc_exp_year')
    is_valid = not len(Customer.objects.filter(pk=user))
    if is_valid == False:
        return HttpResponse("Username taken")
    elif len(user) < 5:
        return HttpResponse("Username must be at least 5 characters long")
    elif len(pw) < 5:
        return HttpResponse("Password must be at least 5 characters long")
    elif len(ccname) < 2:
        return HttpResponse("Invalid name")
    elif len(ccnumber) < 15 or len(ccnumber) > 16 or not ccnumber.isdigit():
        return HttpResponse("Invalid credit card number")
    elif len(ccexpmonth) == 0 or len(ccexpmonth) > 2 or not ccexpmonth.isdigit():
        return HttpResponse("Invalid expiration month")
    elif len(ccexpyear) != 4 or not ccexpyear.isdigit():
        return HttpResponse("Invalid expiration year")
    elif is_valid:
        Customer.objects.create(username=user, password=pw, cc_name=ccname, cc_number=ccnumber, cc_exp_month = ccexpmonth, cc_exp_year=ccexpyear)
        return HttpResponse(is_valid)
    else:
        return HttpResponse("Registration process needs more refinement!")

def login(request):
    user = request.POST.__getitem__('username')
    pw = request.POST.__getitem__('password')
    is_valid = bool(len(Customer.objects.filter(pk=user, password = pw)))
    if is_valid:
        is_valid = user
    return HttpResponse(is_valid)

def update_seat_number(request):
    user = request.POST.__getitem__('username')
    seatnum = request.POST.__getitem__('seat_number')
    is_valid = bool(len(Customer.objects.filter(pk=user)))
    if is_valid:
        Customer.objects.filter(pk=user).update(seat_number = seatnum)
        Cart.objects.filter(username__exact= request.POST.__getitem__('username')).delete()
    return HttpResponse(is_valid)






