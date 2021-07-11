from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from store.models import Customer


class CustomerCreationForm(UserCreationForm):

    def save(self, commit=True):
        user = super(CustomerCreationForm, self).save(commit=False)
        user.username = user.email
        if commit:
            user.save()
        return user

    class Meta:
        model = Customer
        fields = ('first_name', 'last_name', 'email', 'address')