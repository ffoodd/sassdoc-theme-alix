{% if item.description %}
  <h5 class="item__sub-heading">Description</h5>
  <p class="item__description">{{ item.description|safe }}</p>
{% endif %}
