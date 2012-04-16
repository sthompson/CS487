from django.conf.urls.defaults import patterns, include, url
from django.conf.urls.defaults import*
from ballpark.views import*

# Uncomment the next two lines to enable the admin:
from django.contrib import admin 
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^mysite/', include('mysite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    ('^stadium/$', stadium),
    ('^restaurant/$', restaurant),
    ('^menu_item/$', menu_item),
    ('^extra_item/$', extra_item),
    ('^order_status_retrieval/$', order_status_retrieval),
    ('^order_submission/$', order_submission),
    ('^create_username/$', create_username),
    ('^update_seat_number/$', update_seat_number),
    ('^add_to_cart/$', add_to_cart),
    ('^view_cart/$', view_cart),
    ('^empty_cart/$', empty_cart),
    ('^delete_item/$', delete_item),
    ('^login/$', login),
                       
)
