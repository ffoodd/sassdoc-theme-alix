<article id="{{ group_name }}-{{ item.context.type }}-{{ item.context.name }}" class="item{% if item.alias %}  item--alias{% endif %}{% if 'deprecated'|in(item) %}  item--deprecated{% endif %}">
  {% include '../annotations/name.html.swig' %}

  {% include '../annotations/deprecated.html.swig' %}

  {% include '../annotations/preview.html.swig' %}

  {% if not item.alias %}

    {% for annotation in display.annotations[item.context.type] %}
      {% set path = '../annotations/' + annotation + '.html.swig' %}
      {% include path %}
    {% endfor %}

  {% else %}

    <p>Refer to <a href="#{{ item.context.type }}-{{ item.alias }}">{{ item.alias }}</a>.</p>

  {% endif %}
</article>