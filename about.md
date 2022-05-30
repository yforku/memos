---
permalink: /ABOUT/
---

# About

Ever did something and forgot how some years later? 
Or months later? Or even weeks later? 
Therefore, keep a memo about it! 
I am C. BinKadal, Sendirian, Berhad, and this is the Way!

<br>
# More Information

<ul><li>
{% for ii in site.navbarlinks %}
  {% if ii.navbar == "GitHub Page" %}
    <a href="{{ ii.link | relative_url }}">{{ ii.navbar }}</a>
  {% endif %}
{% endfor %}
</li><li>
{% for ii in site.navbarlinks %}
  {% if ii.navbar == "GitHub" %}
    <a href="{{ ii.link | relative_url }}">{{ ii.navbar }}</a>
  {% endif %}
{% endfor %}
</li></ul><br>

# This is the Way!

