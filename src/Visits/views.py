from django.shortcuts import render
from .models import PageVisits
def homepage(request):
  path=request.build_absolute_uri()
  PageVisits.objects.create(page=request.path)

  context2={}

  context={
    "totalvisits":PageVisits.objects.all().count(),
    "pagevisits":PageVisits.objects.filter(page=request.path).count(),


  }
  context2["percentage"]=(context["pagevisits"]/context["totalvisits"])*100
  context2["percentage"]=format('%.2f' % (context2["percentage"]))
  
  context.update(context2)

 
  return render(request,"templates/helloworld.html",context)