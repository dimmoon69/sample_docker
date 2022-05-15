from django.db import models


class Product(models.Model):
    name = models.CharField("Наименование", max_length=275)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']
        verbose_name = ""
        verbose_name_plural = ""
