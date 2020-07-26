---
layout: default
---

<h1>This is a blog about<br/>disco music.</h1>

<figure class="full">
  <img src="{{ site.baseurl }}/assets/img/home-record.jpg"/>
</figure>

<h2>Latest posts</h2>
<ul>
  {% for post in site.posts %}
    <li>
      <p><a href="{{ post.url }}">{{ post.title }}</a></p>
      <p>{{ post.excerpt }}</p>
    </li>
  {% endfor %}
</ul>


<p><span>Main photo by <a href="https://unsplash.com/@skylarfaithfilm?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Skylar Sahakian</a> on <a href="https://unsplash.com/?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span></p>