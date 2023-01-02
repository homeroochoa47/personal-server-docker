from django.db import models


class MyInformation(models.Model):
    # stuff about me
    first_name = models.CharField(max_length=50, blank=True, null=True)
    profile_pic = models.URLField(blank=True)
    location = models.CharField(max_length=50, blank=True, null=True)
    resume = models.URLField(blank=True)
    email = models.EmailField(max_length=255, blank=True, null=True)

    # links to sites
    github = models.URLField(blank=True, null=True)
    linkedin = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.first_name


class Projects(models.Model):
    title = models.CharField(max_length=20, blank=True, null=True)
    cover_image = models.URLField(blank=True, null=True)
    description = models.TextField(blank=False, null=True)

    def __str__(self):
        return self.title
