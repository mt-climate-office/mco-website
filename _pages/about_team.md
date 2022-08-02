---
layout: single
title: Meet the Team
permalink: /about/team/
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/about_banner.jpg
  caption: Augusta, MT (Photo by Michael Bourgault)
excerpt: " <br />"
classes: wide
sidebar:
  title: "About Us"
  nav: about-sidebar
---
{% for t in site.data.teams %}
  <h1 style="margin-top: 10px;">{{t.name}}</h1>
  {% for p in site.data.team %}
  {% if p.team == t.short %}
  <h3 style="margin: 0;">{{p.name}}</h3>
  {{p.position}}
  <table>
    <tr>
      <td>  
        <div class="author__avatar" style="float: left">
          <img src="{{ site.url }}{{ site.baseurl }}/{{ p.photo }}" alt="{{ p.name }}" itemprop="image">
        </div>
      </td>
      <td>
        <div>
          {{p.bio}}
        </div>
      </td>
    </tr>
  </table>
  <div>
    {% for link in p.links %}
      {% if link.label and link.url %}
        <li style="list-style: none; margin: 0; padding: 0; display: inline"><a href="{{ link.url }}" rel="nofollow noopener noreferrer"><i class="{{ link.icon | default: 'fas fa-link' }}" aria-hidden="true"></i> {{ link.label }}</a></li>
    {% endif %}
  {% endfor %}
</div>
<div class="feature__wrapper"></div>
  {% endif %}
  {% endfor %}
{% endfor %}

