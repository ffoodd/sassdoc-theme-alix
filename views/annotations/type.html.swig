{% if item.type %}
  <h5 class="item__sub-heading">Type</h5>

  <p>
  {% if item.type == "*" %}
    Any
  {% else %}
    <code>{{ item.type | display_as_type }}</code>
  {% endif %}
  </p>
{% endif %}
