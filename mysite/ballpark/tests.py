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

