{% if site_name %}
site_name: {{ site_name }}
{% else %}
site_name: Docs
{% endif %}

theme:
  name: material
  font: false
  logo: assets/logo.svg
  search: true
  features:
    - quick-links
    - navigation
    - search
    - toc
    - fullscreen
    - bookmarks
    - tabs
    - code
    - edit-on-github
    - language-selector
    - code
    - cover
    - footer
    - social-share
    - theme-switcher
nav:
  - Home: index.md
  {% if types %}
  - Types:
    {% for item in types -%}
    - {{ item.name }} : {{ item.file }}
    {% endfor %}
  {% endif %}
  {% if modules %}
  - Modules:
    {% for item in modules -%}
    - {{ item.name }} : {{ item.file }}
    {% endfor %}
  {% endif %}
  {% if globals %}
  - Globals:
    {% for item in globals -%}
    - {{ item.name }} : {{ item.file }}
    {% endfor %}
  {% endif %}
extra:
  footer: ""

extra_css:
  - stylesheets/extra.css

markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
