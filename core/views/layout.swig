{#
    takes title, [flash]

    defines blocks:
      title
      head
      nav
      links
      content
      footer
      scripts
  #}
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>{% block title %}{{ title }}{% endblock %}</title>

  {% block head %}
  <link rel="stylesheet" href="{{res.scope}}assets/css/bootstrap.css">
  <link rel="stylesheet" href="{{res.scope}}assets/css/flat-ui.css">
  <link rel="stylesheet" href="{{res.scope}}assets/css/loadingbar.css">
  <link rel="stylesheet" href="{{res.scope}}assets/prettify/prettify.css">
  <link rel="stylesheet" href="{{res.scope}}assets/css/main.css">
  {% endblock %}
</head>
<body>
  {% block nav %}
  <div class="navbar navbar-fixed" id="nav">
            <div class="navbar-inner">
              <div class="container">
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target="#nav-collapse-01">
                </button>
                <a href="{{res.scope}}" class="navbar-brand">{{title}}</a>
                {% if !auth %}
                <div class="nav-collapse collapse in" id="nav-collapse-01">
                  <ul class="nav pull-right">
                    <li><a href="/random" class="jump">jump</a></li>
                    <li class="divider"></li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Settings <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu">
                        <li><a href="#tearDownTheSession">Log out</a></li>
                        <li class="divider"></li>
                        <li><a href="#completelyRevokeOauth" class="dropdown-danger">Unauthorize {{title}}</a></li>
                      </ul>
                    </li>
                  </ul>
                  </div><!--/.nav-collapse -->
                  {% endif %}
              </div>
            </div>
          </div>
  {% endblock %}
  {% if flash %}
  <div class="alert alert-error">
    {{flash}}
    <button type="button" class="close fui-cross" data-dismiss="alert"></button>
  </div>
  {% endif %}
  {% block content %}{% endblock %}
  {% block footer %}
    <div class="bottom-menu navbar navbar-fixed navbar-fixed-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-2 navbar-brand">
            <a href="{{res.scope}}">{{title}}</a>
          </div>
          <div class="col-md-8">
            <ul class="bottom-links">
              <li><a href="https://github.com/b3ngr33ni3r/critic/issues">Issues</a></li>
              <li><a href="https://github.com/b3ngr33ni3r/critic/wiki">Wiki</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  {% endblock %}
  {% block scripts %}
  <!-- Load JS here for greater good =============================-->
    <script src="{{res.scope}}assets/js/jquery-1.8.3.min.js"></script>
    <script src="{{res.scope}}assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="{{res.scope}}assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="{{res.scope}}assets/js/bootstrap.min.js"></script>
    <!--<script src="{{res.scope}}assets/js/bootstrap-select.js"></script>
    <script src="{{res.scope}}assets/js/bootstrap-switch.js"></script>-->
    <script src="{{res.scope}}assets/js/flatui-checkbox.js"></script>
    <script src="{{res.scope}}assets/js/flatui-radio.js"></script>
    <script src="{{res.scope}}assets/js/jquery.tagsinput.js"></script>
    <script src="{{res.scope}}assets/js/jquery.placeholder.js"></script>
    <!--<script src="{{res.scope}}assets/js/bootstrap-typeahead.js"></script>-->
    <script src="{{res.scope}}assets/prettify/prettify.js"></script>
    <script src="{{res.scope}}assets/js/jquery.loadingbar.min.js"></script>
  {% endblock %}
</body>
</html>