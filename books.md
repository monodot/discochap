---
title: Recommended books
---

If you're looking for books to learn more about disco, or perhaps a gift for the disco fan in your life, then look no further!

**Here are my favourite books on disco, with my thoughts:**

{% for book in site.books %}
  <h2>
    {{ book.title }}
  </h2>
  <p>By {{ book.author }}</p>
  <p>{{ book.content | markdownify }}</p>
{% endfor %}