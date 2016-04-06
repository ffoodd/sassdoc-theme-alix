{% if item.since.length > 1 %}
  <h5 class="item__sub-heading">Changelog</h5>

  <ul class="list-unstyled">
    {% for since in item.since %}
      <li>{{ since.version }}{% if since.description %} &mdash; {{ since.description|safe }}{% endif %}</li>
    {% endfor %}
  </ul>
{% endif %}
