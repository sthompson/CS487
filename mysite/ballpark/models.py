from django.db import models
from datetime import date
from django.db.models import Max
from django.db.models import F

class Stadium(models.Model):
    stadium_name = models.CharField(max_length=25, primary_key=True)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    latitude = models.DecimalField(max_digits=10, decimal_places=7)

    class Meta:
        verbose_name_plural = "Add/Update Stadium"
    
    def __unicode__(self):
        return self.stadium_name

class Restaurant(models.Model):
    restaurant_name = models.CharField(max_length=25)
    stadium_name = models.ForeignKey(Stadium)
    delivery_fee = models.DecimalField(max_digits=6, decimal_places=2)
    logo_url = models.CharField(max_length=120)
    current_order_number = models.IntegerField(default=0)
    current_business_date = models.DateField(auto_now_add=True)

    def __unicode__(self):
        return u'%s-%s' % (self.restaurant_name, self.stadium_name)
    
    class Meta:
        verbose_name_plural = "Add/Update Restaurant"
        unique_together = ('stadium_name', 'restaurant_name')


class Item_type(models.Model):
    item_type = models.CharField(max_length=20, primary_key=True)

    def __unicode__(self):
        return self.item_type

    class Meta:
        verbose_name_plural = "Item Types"

class Menu_item(models.Model):
    restaurant = models.ForeignKey(Restaurant)
    item_name = models.CharField(max_length=20)
    item_price = models.DecimalField(max_digits=6, decimal_places=2)
    item_type = models.ForeignKey(Item_type)
    picture_url = models.CharField(max_length=120)

    def __unicode__(self):
        return self.item_name
    
    class Meta:
        unique_together = ('restaurant', 'item_name')
        verbose_name_plural = "Add/Edit Main Menu Items"

class Extra_item(models.Model):
    restaurant = models.ForeignKey(Restaurant)
    extra_name = models.CharField(max_length=20)
    extra_price = models.DecimalField(max_digits=6, decimal_places=2)

    def __unicode__(self):
        return self.extra_name
    
    class Meta:
        unique_together = ('restaurant', 'extra_name')
        verbose_name_plural = "Add/Edit Extra Menu Items"

class Status_description(models.Model):
    order_status_description = models.CharField(max_length=20, primary_key=True)

    def __unicode__(self):
        return self.order_status_description

    class Meta:
        verbose_name_plural = "Status Descriptions"

class Customer(models.Model):
    username = models.CharField(max_length=30, primary_key=True)
    password = models.CharField(max_length=30)
    cc_name = models.CharField(max_length=20, verbose_name='Card holder\'s name', blank=True, default='')
    cc_number = models.CharField(max_length=20, verbose_name='Credit card number', blank=True, default='')
    cc_exp_month = models.CharField(max_length=20, verbose_name='Expiration month', blank=True, default='')
    cc_exp_year = models.CharField(max_length=20, verbose_name='Expiration year', blank=True, default='')
    seat_number = models.CharField(max_length=20, blank=True,default='')
    
    def __unicode__(self):
        return u'%s' % (self.username)
    
    class Meta:
        verbose_name_plural = "Customers"

class Order_status(models.Model):
    transaction_number = models.AutoField(primary_key=True)
    user = models.ForeignKey(Customer)
    order_number = models.IntegerField(default = 0)
    restaurant = models.ForeignKey(Restaurant)
    date_of_order = models.DateField()
    seat_number = models.CharField(max_length=20)
    order_status_description = models.ForeignKey(Status_description, default = 'Cooking')
    
    def save(self, *args, **kwargs):
        if self.order_number == 0:
            restaurant_date = Restaurant.objects.get(pk= self.restaurant_id).current_business_date
            self.date_of_order = date.today()
            if restaurant_date == self.date_of_order:
                Restaurant.objects.filter(pk=self.restaurant_id).update(current_order_number = F('current_order_number') + 1)
            else:
                Restaurant.objects.filter(pk=self.restaurant_id).update(current_business_date = self.date_of_order, current_order_number = 1)
            self.order_number = Restaurant.objects.get(pk=self.restaurant_id).current_order_number
        super(Order_status, self).save(*args, **kwargs)

    def __unicode__(self):
        return u'%s: %s - Order %d' % (self.date_of_order, self.restaurant, self.order_number)
    
    def customer(self):
        return self.user.username

    class Meta:
        verbose_name_plural = "Update Order Status"
        unique_together = ('order_number', 'restaurant','date_of_order')

class Order(models.Model):
    order_number = models.ForeignKey(Order_status)
    item_number = models.IntegerField(default=0)
    item_name = models.CharField(max_length=20, verbose_name='item')
    item_price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name='price')
    item_quantity = models.IntegerField(verbose_name='quantity')

    def save(self, *args, **kwargs):
        if self.item_number == 0:
            largest_item_number = Order.objects.filter(order_number = self.order_number_id).aggregate(Max('item_number'))['item_number__max']
            if largest_item_number != None:
                self.item_number = largest_item_number + 1
            else:
                self.item_number = 1
        super(Order, self).save(*args, **kwargs)
    
    def __unicode__(self):
        return u'%s Item %d - %s' % (self.order_number, self.item_number, self.item_name)
    
    def customer(self):
        return self.order_number.user.username

    class Meta:
        verbose_name_plural = "Order History: Items"
        unique_together = ('order_number','item_number', 'item_name')

class Order_extra(models.Model):
    order_number = models.ForeignKey(Order)
    extra_name = models.CharField(max_length=20, verbose_name='Extra')
    extra_price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name='price')
    
    def __unicode__(self):
        return u'%s Extra: %s' % (self.order_number, self.extra_name)
    
    def customer(self):
        return self.order_number.order_number.user.username
    
    class Meta:
        verbose_name_plural = "Order History: Item Extras"
        unique_together = ('order_number','extra_name')

class Cart(models.Model):
    restaurant = models.ForeignKey(Restaurant)
    has_extra = models.IntegerField(default=0)
    username = models.ForeignKey(Customer)
    item_name = models.CharField(max_length=20, verbose_name='item')
    item_quantity = models.IntegerField(verbose_name='quantity')
    item_price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name='price')
    
    def __unicode__(self):
        return u'%s - Quantity: %d' % (self.item_name, self.item_quantity)
    
    def customer(self):
        return self.username.username

    class Meta:
        verbose_name_plural = "Existing Cart: Add/Update an Item"

class Cart_extra(models.Model):
    cart_item = models.ForeignKey(Cart)
    extra_name = models.CharField(max_length=20, verbose_name='Extra')
    extra_price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name='price') 
    
    def __unicode__(self):
        return u'%s Extra: %s' % (self.cart_item, self.extra_name)
    
    def customer(self):
        return self.cart_item.username.username
    
    class Meta:
        verbose_name_plural = "Existing Cart: Add/Update Extra for an Item"
        unique_together = ('cart_item','extra_name')








