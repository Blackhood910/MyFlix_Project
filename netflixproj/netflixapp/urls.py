from django.urls import path
from .views import Home, ProfileList , ProfileCreate  , MovieList

app_name = 'netflixapp'


urlpatterns = [
    path('',Home.as_view(),name="Home"),
    path('profiles/',ProfileList.as_view(),name="profile-list"),
    path('profiles/create/',ProfileCreate.as_view(),name="profile-create"),
    path('watch/<str:profile_id>/',MovieList.as_view(),name="movie-list"),
]
