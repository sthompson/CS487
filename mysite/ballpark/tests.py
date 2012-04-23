"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import Client, TestCase
from ballpark.models import Restaurant
from django.utils import simplejson

class SimpleTest(TestCase):
   def setUp(self):
      self.client = Client()

      """
      RESTAURANTS
      """

   def test_restaurant(self):
      response = self.client.post('/restaurant/',{'stadium_name':'Comiskey Park'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, 'Giordanos')
      
      response = self.client.post('/restaurant/',{'stadium_name':'made up name'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "")

      """
      STADIUMS
      """

   def test_stadium(self):
      response = self.client.post('/stadium/',{'longitude':'-87.633','latitude':'41.831'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, 'Comiskey Park')

      response = self.client.post('/stadium/',{'longitude':'0','latitude':'0'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "")

      """
      UPDATE SEAT
      """

   def test_update_seat(self):
      response = self.client.post('/update_seat_number/',{'username':'randomname','seat_number':'A123'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      response = self.client.post('/update_seat_number/',{'username':'user1','seat_number':'A123'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "True")

      """
      LOG IN
      """
   def test_log_in(self):
      response = self.client.post('/login/',{'username':'randomuser','password':'test2'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      response = self.client.post('/login/',{'username':'user1','password':'pass1'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "user1")

      response = self.client.post('/login/',{'username':'user1','password':'test3'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "False")

      """
      ORDER SUBMISSION & ORDER STATUS
      """
   def test_order_submission(self):
      response = self.client.post('/order_submission/',{'username':'user1'})
      self.assertEqual(response.status_code, 200)

      response = self.client.post('/add_to_cart/',{'username':'user1','stadium_name':'Comiskey Park','restaurant_name':'Giordanos','Stuffed Pizza,5': ''})

      response = self.client.post('/order_submission/',{'username':'user1'})
      self.assertEqual(response.status_code, 200)

      response = self.client.post('/view_cart/',{'username':'user1'})
      self.assertContains(response, "")

      response =
      self.client.post('/order_status_retrieval/',{'username':'user1'})
      self.assertEquals(response.status_code, 200)
      list = simplejson.loads(response.content)
      for x in list:
         print x['total_price']
         
      self.assertContains(response1, '1')

      response = self.client.post('/order_submission/',{'username':'unknown'})
      self.assertEqual(response.status_code, 200)

      response = self.client.post('/order_status_retrieval/',{'order_num':'1'})
      self.assertEqual(response.status_code, 200)
      self.assertContains(response, "Cooking")

