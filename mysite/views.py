from django.shortcuts import render
from .models import MyInformation


# Create your views here.
def main(request):
    my_info = MyInformation.objects.filter(first_name='Homero')[0]
    context = {'my_info': my_info}
    return render(request, 'main.html', context)
