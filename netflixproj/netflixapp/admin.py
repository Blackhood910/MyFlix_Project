from django.contrib import admin
from netflixapp.models import Movie,Vedio,Profile,CustomUser

# Register your models here.

admin.site.register(Movie)
admin.site.register(Vedio)
admin.site.register(Profile)
admin.site.register(CustomUser)