{% extends 'layout.swig' %}

{% block content %}
<div class="container">
  {% if auth %}
  <div class="row">
    <div class="jumbotron">
      <h1>{{title}}</h1>
      <p>Simple, modern, and easy code review tailored to github.</p>
      <p><a class="btn btn-primary btn-lg" role="button" href="#about">Learn more</a> <a class="btn btn-secondary btn-lg" role="button" href="https://github.com/login/oauth/authorize?client_id={{auth.id}}&scope={{auth.scope}}">Login with Github</a></p>
    </div>
    <div id="about">
      <p>I should write things here about how {{title}} is designed and used...</p>
    </div>
  </div>
  {% else %}
  <div class="row" id="code_wrapper" style="padding-bottom:110px;">
    <h3 class="title"></h3>
    <div class="code"></div>
  </div>
    {% endif %}
</div>
{% endblock %}

{% block scripts %}
{% parent %}
{% if !auth %}
<script src="{{res.scope}}assets/js/application.js"></script>
{% endif %}
{% endblock %}