<<<<<<< HEAD
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import TestCase


class SimpleTest(TestCase):
    def test_basic_addition(self):
        """
        Tests that 1 + 1 always equals 2.
        """
        self.assertEqual(1 + 1, 2)
=======
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import Client, TestCase
from ballpark.models import Restaurant
from django.utils import simplejson
from django.core.exceptions import ObjectDoesNotExist

class SimpleTest(TestCase):
   def setUp(self):
      self.client = Client()

      """
      CUSTOMERS
      
      The following user already exists in the database:
      Username = user1
      Password = pass1
      """
      
   def test_create_user(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "True")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "test2")

   def test_create_user_invalid_name(self):
      response = self.client.post('/create_username/', {'username': 'five', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Username must be at least 5 characters long")
      
      response = self.client.post('/login/', {'username': 'five', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_user_invalid_pass(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'the', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Password must be at least 5 characters long")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'the'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_user_invalid_cc_name(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'test2', 'cc_name': 'A', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Invalid name")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_user_invalid_cc_number(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '123456789', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Invalid credit card number")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_user_invalid_exp_month(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': 'blah', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Invalid expiration month")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_user_invalid_exp_year(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': 'blah'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Invalid expiration year")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

   def test_create_duplicate_user(self):
      response = self.client.post('/create_username/', {'username': 'user1', 'password': 'test2', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Username taken")

   def test_create_user_duplicate_pass(self):
      response = self.client.post('/create_username/', {'username': 'test2', 'password': 'pass1', 'cc_name': 'Joe Enron', 'cc_number': '1234567890123456', 'cc_exp_month': '12', 'cc_exp_year': '2012'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "True")
      
      response = self.client.post('/login/', {'username': 'test2', 'password': 'pass1'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "test2")
      
      """
      CARTS
      """

   def test_add_item(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': ''})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      found = "false"
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==0:
		found = "true"
      self.assertEqual(found, "true")

   def test_add_item_with_extra(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese,Tomatoes'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      found = "false"
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==1:
		found = "true"
      self.assertEqual(found, "true")

   def test_add_item_with_duplicate_main(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': ''})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': ''})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      count = 0
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==0:
		count=count+1
      self.assertEqual(count, 2)

   def test_add_item_with_duplicate_main_and_extra(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Tomatoes'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      count = 0
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==1:
		count=count+1
      self.assertEqual(count, 2)

   def test_add_item_with_main_and_duplicate_extra(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Meatball Sandwich,2': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      count = 0
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==1:
		count=count+1
	if x["item_name"]=="Meatball Sandwich" and x["item_quantity"]==2 and x["has_extra"]==1:
		count=count+1
      self.assertEqual(count, 2)

   def test_add_item_with_duplicate_main_and_duplicate_extra(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      # Loop through the items, make sure one of them fits the description of the newly added item.
      count = 0
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==1:
		count=count+1
      self.assertEqual(count, 2)

   def test_add_item_that_does_not_exist_by_name(self):
      try:
	response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Gross Food,2': ''})
      except ObjectDoesNotExist:
	pass
      else:
	fail

   def test_add_item_that_does_not_exist_by_restaurant(self):
      try:
	response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Randomstaurant', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': ''})
      except ObjectDoesNotExist:
	pass
      else:
	fail

   def test_add_item_that_does_not_exist_by_stadium(self):
      try:
	response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Unknown Park', 'Stuffed Pizza,5': ''})
      except ObjectDoesNotExist:
	pass
      else:
	fail

   def test_view_empty_cart(self):
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 2)	# minimum length of response is 2 due to the brackets, []

   def test_view_cart_of_non_existent_user(self):
      response = self.client.post('/view_cart/', {'username': 'randomuser'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 2)	# minimum length of response is 2 due to the brackets, []

   def test_empty_cart(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/empty_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 2)	# minimum length of response is 2 due to the brackets, []

   def test_empty_empty_cart(self):
      response = self.client.post('/empty_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 2)	# minimum length of response is 2 due to the brackets, []

   def test_empty_cart_of_nonexistent_user(self):
      response = self.client.post('/empty_cart/', {'username': 'randomuser'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 0)

   def test_remove_item_from_cart(self):
      response = self.client.post('/add_to_cart/', {'username': 'user1', 'restaurant_name': 'Giordanos', 'stadium_name': 'Comiskey Park', 'Stuffed Pizza,5': 'Cheese'})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      
      primarykey = 0
      # Loop through the items, make sure one of them fits the description of the newly added item.
      found = "false"
      list = simplejson.loads(response.content)
      for x in list:
	if x["item_name"]=="Stuffed Pizza" and x["item_quantity"]==5 and x["has_extra"]==1:
		found = "true"
		primarykey = x["pk"]
      self.assertEqual(found, "true")

      response = self.client.post('/delete_item/', {'username': 'user1', 'pk': primarykey})
      self.assertEqual(response.status_code, 200)
      
      response = self.client.post('/view_cart/', {'username': 'user1'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 2)	# minimum length of response is 2 due to the brackets, []

   def test_remove_item_from_nonexistent_user(self):
      response = self.client.post('/delete_item/', {'username': 'randomuser', 'pk': '2'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 0)

   def test_remove_nonexistent_item(self):
      response = self.client.post('/delete_item/', {'username': 'user1', 'pk': '200'})
      self.assertEqual(response.status_code, 200)
      self.assertEqual(len(response.content), 0)

      """
      RESTAURANTS
      """

   def test_restaurant(self):
      # Tests that a list of restaurants available at given stadium is returned
      response = self.client.post('/restaurant/',{'stadium_name':'Comiskey Park'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, 'Giordanos')
      self.assertContains(response, 'Maxwell Street Original')
      self.assertContains(response, 'Al\'s Beef')
      
      # Tests that an empty list is returned if given an unknown stadium
      response = self.client.post('/restaurant/',{'stadium_name':'made up name'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "")

      """
      STADIUMS
      """

   def test_stadium(self):
      # Tests that, given coordinates known to coincide with a stadium, the
      # correct stadium is returned
      response = self.client.post('/stadium/',{'longitude':'-87.633','latitude':'41.831'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, 'Comiskey Park')

      # Tests that an empty string is returned when given coordinates where no
      # stadium exists
      response = self.client.post('/stadium/',{'longitude':'0','latitude':'0'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "")

      """
      UPDATE SEAT
      """

   def test_update_seat(self):
      # Tests that updating a seat number of a nonexistant customer fails
      response = self.client.post('/update_seat_number/',{'username':'randomname','seat_number':'A123'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      # Tests that updating the seat number of a customer succeeds
      response = self.client.post('/update_seat_number/',{'username':'user1','seat_number':'A123'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "True")

      """
      LOG IN
      """
   def test_log_in(self):
      # Tests that logging in with a nonexistant username fails
      response = self.client.post('/login/',{'username':'randomuser','password':'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      # Tests that logging in with a valid username and password succeeds
      response = self.client.post('/login/',{'username':'user1','password':'pass1'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "user1")

      # Tests that logging in with a valid username, but invalid password fails
      response = self.client.post('/login/',{'username':'user1','password':'test3'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      """
      ORDER SUBMISSION & ORDER STATUS
      """
   def test_order_submission(self):
      # Submitting an empty cart
      response = self.client.post('/order_submission/',{'username':'user1'})
      self.assertEqual(response.status_code, 200)

      # User1 already exists, populate a cart
      response = self.client.post('/add_to_cart/',{'username':'user1','stadium_name':'Comiskey Park','restaurant_name':'Giordanos','Stuffed Pizza,5': ''})

      # Submit user1's cart
      response = self.client.post('/order_submission/',{'username':'user1'})
      self.assertEqual(response.status_code, 200)

      # Test that after submission, the cart is emptied
      response = self.client.post('/view_cart/',{'username':'user1'})
      self.assertContains(response, "")

      # Tests that submitting a card for a nonexistant user fails
      try:
         response = self.client.post('/order_submission/',{'username':'unknown'})
      except ObjectDoesNotExist:
         pass

      # Test that user1's cart was submitted successfully by retreiving it again
      response = self.client.post('/order_status_retrieval/',{'username':'user1'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Cooking")

>>>>>>> 88673d18649e58e652b123c6b0f18065ece22be1
