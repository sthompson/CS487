from django.db import models

class Stadium(models.Model):
    stadium_name = models.CharField(max_length=25, primary_key=True)

    def __unicode__(self):
        return self.stadium_name

class Restaurants(models.Model):
    restaurant_name = models.CharField(max_length=25, primary_key=True)
    stadium_name = models.ForeignKey(Stadium)

    def __unicode__(self):
        return self.restaurant_name


class Item_type(models.Model):
    item_type = models.CharField(max_length=20, primary_key=True)

    def __unicode__(self):
        return self.type_name

class Menu_items(models.Model):
    restaurant_name = models.ForeignKey(Restaurants)
    item_name = models.CharField(max_length=20)
    item_price = models.DecimalField(max_digits=6, decimal_places=2)
    item_type = models.ForeignKey(Item_type)

    def __unicode__(self):
        return self.item_name
    
    class Meta:
        unique_together = ('restaurant_name', 'item_name')

class Extra_items(models.Model):
    restaurant_name = models.ForeignKey(Restaurants)
    extra_name = models.CharField(max_length=20)
    extra_price = models.DecimalField(max_digits=6, decimal_places=2)

    def __unicode__(self):
        return self.extra_name
    
    class Meta:
        unique_together = ('restaurant_name', 'extra_name')

class Status_description(models.Model):
    order_status_description = models.CharField(max_length=20, primary_key=True)

    def __unicode__(self):
        return self.status_description

class Order_status(models.Model):
    order_num = models.AutoField(primary_key=True)
    seat_num = models.CharField(max_length=20)
    order_status_description = models.ForeignKey(Status_description)

    def __unicode__(self):
        return u'Order %d: %s' % (self.order_num, self.order_status_description)

class Orders(models.Model):
    order_num = models.ForeignKey(Order_status)
    restaurant_name = models.ForeignKey(Restaurants)
    timestamp = models.DateTimeField(auto_now_add=True)
    item_name = models.CharField(max_length=20)
    item_price = models.DecimalField(max_digits=6, decimal_places=2)
    item_quantity = models.IntegerField()
    extra_name = models.CharField(max_length=20)
    extra_price = models.DecimalField(max_digits=6, decimal_places=2)

    def __unicode__(self):
        return self.order_num

    class Meta:
        unique_together = ('order_num', 'restaurant_name', 'item_name', 'item_quantity', 'extra_name')

class Roles(models.Model):
    role = models.CharField(max_length=20, primary_key=True)

    def __unicode__(self):
        return self.role

class Administrator(models.Model):
    user = models.CharField(max_length=20, primary_key=True)
    role = models.ForeignKey(Roles)
    password = models.CharField(max_length=20)

    def __unicode__(self):
        return self.user


