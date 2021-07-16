---
title: Best Books about Disco Music
featured: 10
thumb: 
  src: https://ik.imagekit.io/w8aolfcwcnd/dc/jessica-ruscello-OQSCtabGkSY-unsplash_Na5cwphKWP.webp?tr=w-500,h-300,cm-extract
  width: 500
  height: 300  # 334
  credit: Photo by <a href="https://unsplash.com/@jruscello?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Jessica Ruscello</a> on <a href="https://unsplash.com/s/photos/bookstore?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
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