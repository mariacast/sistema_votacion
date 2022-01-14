from django.core.urlresolvers import reverse
from django.utils.safestring import mark_safe
from django.forms import widgets
from django.utils.encoding import force_text
from django_select2.forms import ModelSelect2Widget
from django import forms
from .models import *
from django.core.exceptions import ValidationError


class RelatedFieldWidgetCanAdd(widgets.Select):
    """
    Autor: Daniel Lopez
    Fecha: octubre 11 2018
    Widget para agregar un boton que sirve para agregar una instancia mientras se llena un formulario y que esta se
    agregue al listado
    """
    def __init__(self, related_model, related_url=None, *args, **kwargs):
        super(RelatedFieldWidgetCanAdd, self).__init__(*args, **kwargs)
        if related_url is None:
            related_url = 'admin:{}_{}_add'.format(
                related_model._meta.app_label, related_model._meta.object_name.lower())
        # Be careful that here "reverse" is not allowed
        self.related_url = related_url

    def render(self, name, value, *args, **kwargs):
        # se genera la url del admin de django para ser usado automaticamente
        self.related_url = reverse(self.related_url) + "?_to_field=id&_popup=1"
        output = list(super(RelatedFieldWidgetCanAdd, self).render(name, value, *args, **kwargs))
        output.append(
            u' <a href="{}" class="add-another" id="add_id_{}" onclick="return showAddAnotherPopup(this);"> '.format(
                self.related_url, name))
        output.append(u'<i class="fa fa-plus"></i> Agregar nuevo</a>')
        return mark_safe(u''.join(output))


class MultipleRelatedFieldWidgetCanAdd(widgets.SelectMultiple):
    """
    Autor: Daniel Lopez
    Fecha: noviembre 27 2018
    Widget para agregar un boton que sirve para agregar una instancia mientras se llena un formulario y que esta se
    agregue al listado cuando el campo es de tipo MultipleChoice
    """
    def __init__(self, related_model, related_url=None, *args, **kwargs):
        super(MultipleRelatedFieldWidgetCanAdd, self).__init__(*args, **kwargs)
        if related_url is None:
            related_url = 'admin:{}_{}_add'.format(
                related_model._meta.app_label, related_model._meta.object_name.lower())
        # Be careful that here "reverse" is not allowed
        self.related_url = related_url

    def render(self, name, value, *args, **kwargs):
        # se genera la url del admin de django para ser usado automaticamente
        self.related_url = reverse(self.related_url) + "?_to_field=id&_popup=1"
        output = list(super(MultipleRelatedFieldWidgetCanAdd, self).render(name, value, *args, **kwargs))
        output.append(
            u' <a href="{}" class="add-another" id="add_id_{}" onclick="return showAddAnotherPopup(this);"> '.format(
                self.related_url, name))
        output.append(u'<i class="fa fa-plus"></i> Agregar nuevo</a>')
        return mark_safe(u''.join(output))

class AjaxModelChoiceField(forms.ModelChoiceField):
    """
    Autor: Daniel Henao
    Fecha: 2020-01-01
    Descripción: Se hereda de modelchoiceField para enviar datos vacios en el get del formulario o la vista,
    :param query_post: queryset para validar las opciones de la petición post (debe asignarse despues de haberse
                       instanciado)
    """

    query_post = None

    def to_python(self, value):
        if value in self.empty_values:
            return None
        try:
            key = self.to_field_name or 'pk'
            value = self.query_post.get(**{key: value})
        except (ValueError, TypeError, self.queryset.model.DoesNotExist) as e:
            raise ValidationError(self.error_messages['invalid_choice'], code='invalid_choice')
        return value


class AjaxModelMultipleChoiceField(forms.ModelMultipleChoiceField):
    """
    Autor: Daniel Henao
    Fecha: 2020-01-01
    Descripción: Se hereda de modelchoiceField para enviar datos vacios en el get del formulario o la vista,
    :param query_post: queryset para validar las opciones de la petición post (debe asignarse despues de haberse
                       instanciado)
    """

    query_post = None

    def _check_values(self, value):
        """
        Se soblrescribe el metodo para validar con la query_post en lugar del queryset inicial
        """
        key = self.to_field_name or 'pk'
        # deduplicate given values to avoid creating many querysets or
        # requiring the database backend deduplicate efficiently.
        try:
            value = frozenset(value)
        except TypeError:
            # list of lists isn't hashable, for example
            raise ValidationError(
                self.error_messages['list'],
                code='list',
            )
        for pk in value:
            try:
                self.query_post.filter(**{key: pk})
            except (ValueError, TypeError):
                raise ValidationError(
                    self.error_messages['invalid_pk_value'],
                    code='invalid_pk_value',
                    params={'pk': pk},
                )
        qs = self.query_post.filter(**{'%s__in' % key: value})
        pks = set(force_text(getattr(o, key)) for o in qs)
        for val in value:
            if force_text(val) not in pks:
                raise ValidationError(
                    self.error_messages['invalid_choice'],
                    code='invalid_choice',
                    params={'value': val},
                )
        return qs


class AjaxChoiceField(forms.ChoiceField):
    def valid_value(self, value):
        return True
# fin widgets modulo orden de compra
