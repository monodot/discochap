---
layout: page
title: "The Disco Chap Podcast"
---

I've recorded a pilot episode for a disco podcast on Spotify, via Anchor's new _Podcasts with Music_ feature.

You can [listen on Spotify][podcast]. I hope you enjoy it!

## Show notes

{% for podcast in site.shownotes %}
  <li><a href="{{ podcast.permalink }}">{{ podcast.title }}</a></li>
{% endfor %}


[podcast]: https://open.spotify.com/show/5Z4cFSTE7ZoAWY44CVabpO