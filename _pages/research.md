---
layout: single
title: Research
permalink: /research/
header:
  overlay_image: /assets/images/research_banner.jpg
  caption: "Photo Credit: Unsplash"
excerpt: " <br />"
classes: wide
sidebar:
  title: "Research"
  nav: research-sidebar
---

# Recent Publications

****

{% for pub in site.data.publications %}
### {{pub.title}} 
#### {{pub.authors}}
##### _{{pub.journal}}_ 
> {{pub.abstract}}

[Read Article]({{pub.doi}}){: .btn .btn--info target="_blank"}

****
{% endfor %}