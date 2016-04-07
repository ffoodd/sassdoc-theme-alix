<!DOCTYPE html>
<html lang="en">
    {% set project_title = "SassDoc" %}

    {% if package.name %}
      {% set project_title = (package.name|capitalize) %}
    {% endif %}

    {% if package.title %}
      {% set project_title = package.title %}
    {% endif %}

    <head>
        <meta charset="utf-8" />
        <title>SassDoc for {{ project_title }}{% if package.version %} — v{{ package.version }}{% endif %}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="SassDoc documentation for {{ project_title }}{% if package.version %} — v{{ package.version }}{% endif %}">
        <link href="https://fonts.googleapis.com/css?family=Fira+Sans:400,700,400italic" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="assets/css/main.css" />
        <!-- Open Graph tags -->
        <meta property="og:title" content="{{ project_title }} — SassDoc" />
        <meta property="og:type" content="website" />
        {% if package.description %}
          <meta property="og:description" content="{{ package.description | safe }}" />
        {% else %}
          <meta property="og:description" content="Release the docs!" />
        {% endif %}
        <link href="{{ shortcutIcon.url }}" rel="shortcut icon">
    </head>

    <body>
      <a href="#toc" class="skip">Skip to table of content</a>
      <a href="#content" class="skip">Skip to content</a>

      {# Include header #}
      {% include "includes/header.html.swig" %}


     <main role="main">

        {# Include Sidebar #}
        {% include "includes/sidebar.html.swig" %}

        <div id="content" tabindex="-1">
           <h1>SassDoc for {{ project_title }}{% if package.version %} — v{{ package.version }}{% endif %}</h1>

           {# No item documented #}
           {% if data.length == 0 %}
             <h2>Seems like nothing has been documented yet!</h2>
           {# Some items documented #}

           {% else %}
             {# Loop over the groups #}
             {% for group_name, group in data.byGroupAndType %}
                <h2 id="{{ group_name }}">{{ groups[group_name] }}</h2>

                {# Loop over the types #}
                {% for type, items in group %}

                  {# If items to be displayed in type #}
                  {% if items.length > 0 %}
                    <div id="{{ group_name }}-{{ type }}">
                      <h3>{{ (type + 's') }}</h3>

                      {# Loop over the items #}
                      {% for item in items %}
                        {% include "includes/item.html.swig" with context %}
                      {% endfor %}
                    </div>
                  {% endif %}
                {% endfor %}
             {% endfor %}
           {% endif %}
        </div>
      </main>

      {# Include footer #}
      {% include "includes/footer.html.swig" %}

    </body>
</html>
