from django.conf.urls.defaults import patterns, include, url
from hellodjango.views import root
from hellodjango.restaurants import views as res_views

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
   (r'^$',root), 
   (r'^test/$',res_views.json),
   (r'^restaurants/$',res_views.restaurants),
   (r'^menu/(.+)/$',res_views.menu),
  # (r'^fooditem/([]+)/$',res_views.fooditem),
    # Examples:
    # url(r'^$', 'hellodjango.views.home', name='home'),
    # url(r'^hellodjango/', include('hellodjango.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
