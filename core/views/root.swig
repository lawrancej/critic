{% extends 'layout.swig' %}

{% block content %}
<div class="container" style="padding-bottom:110px;">
  {% if auth %}
  <div class="row">
    <div class="jumbotron">
      <h1>{{title}}</h1>
      <p>Modern, and easy code review tailored to github.</p>
      <p><a class="btn btn-primary btn-lg" role="button" href="#about">Learn more</a> <a class="btn btn-success btn-lg" role="button" href="https://github.com/login/oauth/authorize?client_id={{auth.id}}&scope={{auth.scope}}">Login with Github</a></p>
    </div>
    <div class="row">
      <div class="col-md-4">
        <div class="tile">
          <img src="{{res.scope}}assets/images/icons/clipboard.svg" alt="clipboard" class="tile-image">
          <h3 class="tile-title">Review Everything</h3>
          <p>By reviewing code you're helping to normalize coding conventions, optimize efficiency, and gain a better understanding of how problems are solved.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="tile">
          <img src="{{res.scope}}assets/images/icons/retina.svg" alt="checkmark" class="tile-image">
          <h3 class="tile-title">Check your Notes</h3>
          <p>What do other's have to say? By logging in to check your code for comments and edits, you can receive coding feedback.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="tile">
          <img src="{{res.scope}}assets/images/icons/gift-box.svg" alt="gift box" class="tile-image">
          <h3 class="tile-title">Earn Points</h3>
          <p>When you provide comments or edits, you recive points. Earn enough, and claim your title as a code reviewing pro!</p>
        </div>
      </div>
    </div>
    <div  id="about" class="row">
    <div class="page-header">
      <h1>About <small>Modern and easy code review.</small></h1>
    </div>
    <div class="row">
    <h3 id="whycodereview">Why code review?</h3>
<img src="{{res.scope}}assets/images/icons/search.svg" alt="search" class="col-md-2">

<p class="col-md-6">Critic was originally created to <strong>facilitate anonymous code review</strong> in a classroom environment. We wanted to provide a way for students and faculty members to be able to look over eachothers work in a <strong>double blind</strong> way. While this feature is implemented throughout <a href="https://github.com/b3ngr33ni3r/critic">Critic</a>, it is also quite possible to not use it, by trading these features for a more traditional code review system with a simple option when configuring a custom Critic installation. </p>
</div><div class="row">
<h3 id="howsitworkforusers">How's it work for users?</h3>
<img src="{{res.scope}}assets/images/icons/responsive.svg" alt="responsive" class="col-md-2">
<p class="col-md-6">Critic is designed from the ground up to provide a <strong>simple, intuitive interface</strong> for commenting and editing code, in the browser. Features like syntax highlighting and markdown parsing have been implemented since day one, and remain an important part of the experience. By allowing users to simply login with Github credentials, and working closely with the Github API, Critic is able to provide an experience that <strong>stays out of the way</strong> to allow users to focus on code review, and not the messy semantics of configuring users and groups, uploading code a second time, managing access, and using new tools.</p>
</div><div class="row">
<h3 id="whatmakescritictick">What makes Critic tick?</h3>
<img src="{{res.scope}}assets/images/icons/settings.svg" alt="settings" class="col-md-2">
<p class="col-md-6">Critic is written in javascript, and is powered by <a href="https://nodejs.org">node.js</a> on the backend. Node is an incredible platform for creating fast, performant applications with ease. Critic also makes use of a few awesome front end tools, like <a href="http://designmodo.com/flat">Flat UI</a>, <a href="http://getbootstrap.com">Bootstrap</a>, and <a href="http://jquery.com">jQuery</a>. You can <strong>run your own instance</strong> of critic entirely on your own, with <a href="https://github.com/b3ngr33ni3r/critic/wiki/How-to-host">these instructions</a>.</p></div>
</div>
</div>
  </div>
  {% else %}
  <div class="row" id="code_wrapper">
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