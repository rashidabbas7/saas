from django.db import models

# Create your models here.
class PageVisits(models.Model):
  page=models.TextField(null=True,blank=True)
  timestamp=models.DateTimeField(auto_now_add=True)
  