<aside>
  <nav role="navigation" aria-labelledby="toc-title" id="toc" tabindex="-1">
    <p class="h2-like" id="toc-title">Table of content</p>

    {# No item documented #}
    {% if data.length == 0 %}
      <p>No documented item.</p>

    {# Some items documented #}
    {% else %}
      <ul>
        {# Loop over the groups #}
        {% for group_name, group in data.byGroupAndType %}
        <li>
          <a href="#{{ group_name }}">{{ groups[group_name] }}</a>

          {# Loop over the types #}
          {% for type, items in group %}
            {% if loop.first %}<ul>{% endif %}

              {# If items to be displayed in type #}
              {% if items.length > 0 %}
               <li>
                 <a href="#{{ group_name }}-{{ type }}">{{ (type + 's') }}</a>

                 {# Loop over the items #}
                 {% for item in items %}
                    {% if loop.first %}<ol>{% endif %}
                      <li>
                        <a href="#{{ group_name }}-{{ item.context.type }}-{{ item.context.name }}">{{ item.context.name }}</a>
                      </li>
                    {% if loop.last %}</ol>{% endif %}
                 {% endfor %}
               </li>
            {% if loop.last %}</ul>{% endif %}
          {% endfor %}
        </li>
        {% endfor %}
      </ul>
    {% endif %}
  </nav>
 </aside>