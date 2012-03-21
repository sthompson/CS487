from django.db import models

class Stadium(models.Model):
    stadium_id = models.AutoField(primary_key=True)
    stadium_name = models.CharField(max_length=20, unique=True)

    def __unicode__(self):
        return self.stadium_name

class Restaurants(models.Model):
    restaurant_id = models.AutoField(primary_key=True)
    restaurant_name = models.CharField(max_length=20, unique=True)
    stadium_id = models.ForeignKey(Stadium)

    def __unicode__(self):
        return self.restaurant_name


class Item_type(models.Model):
    item_type_id = models.AutoField(primary_key=True)
    item_type_name = models.CharField(max_length=20, unique=True)

    def __unicode__(self):
        return self.type_name

class Menu_items(models.Model):
    menu_item_id = models.AutoField(primary_key=True)
    restaurant_id = models.ForeignKey(Restaurants)
    item_name = models.CharField(max_length=20)
    item_price = models.DecimalField(max_digits=6, decimal_places=2)
    item_type_id = models.ForeignKey(Item_type)

    def __unicode__(self):
        return self.item_name
    
    class Meta:
        unique_together = ('restaurant_id', 'item_name')

class Extra_items(models.Model):
    extra_item_id = models.AutoField(primary_key=True)
    restaurant_id = models.ForeignKey(Restaurants)
    extra_name = models.CharField(max_length=20)
    extra_price = models.DecimalField(max_digits=6, decimal_places=2)

    def __unicode__(self):
        return self.extra_name
    
    class Meta:
        unique_together = ('restaurant_id', 'extra_name')

class Order_status_codes(models.Model):
    order_status_id = models.AutoField(primary_key=True)
    order_status_description = models.CharField(max_length=20, unique=True)

    def __unicode__(self):
        return self.status_description

class Order_status(models.Model):
    order_num = models.AutoField(primary_key=True)
    order_status_description = models.ForeignKey(Order_status_codes)

    def __unicode__(self):
        return u'Order %d: %s' % (self.order_num, self.order_status_description)

class Orders(models.Model):
    order_id = models.AutoField(primary_key=True)
    order_num = models.ForeignKey(Order_status)
    restaurant_id = models.ForeignKey(Restaurants)
    timestamp = models.DateTimeField()
    item_name = models.CharField(max_length=20)
    item_price = models.DecimalField(max_digits=6, decimal_places=2)
    item_quantity = models.IntegerField()
    extra_name = models.CharField(max_length=20)
    extra_price = models.DecimalField(max_digits=6, decimal_places=2)

    def __unicode__(self):
        return self.order_num

    class Meta:
        unique_together = ('order_num', 'restaurant_id', 'item_name', 'item_quantity', 'extra_name')

class Roles(models.Model):
    role_id = models.AutoField(primary_key=True)
    role = models.CharField(max_length=20, unique=True)

    def __unicode__(self):
        return self.role

class Administrator(models.Model):
    user = models.CharField(max_length=20, primary_key=True)
    role_id = models.ForeignKey(Roles)
    password = models.CharField(max_length=20)

    def __unicode__(self):
        return self.user


