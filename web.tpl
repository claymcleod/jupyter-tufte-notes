{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}



<!DOCTYPE html>
<html>
<head>
{%- block header -%}
<meta charset="utf-8" />
<title>{{resources['metadata']['name']}}</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<link rel="stylesheet" href="/css/jupyter-tufte-notes.css">

<!-- Loading mathjax macro -->
{{ mathjax() }}

{%- endblock header -%}
</head>


<body>
{% block body %}

    <div class="container">
        <div class="row">
            <div class="col-sm-7">
                <h1 id='title'><i>{{resources['metadata']['name']}}</i></h1>
                <div id='author'>By Author</div>
                <div id='date'>{{resources['metadata']['modified_date']}}</div>
                {{ super() }}
            </div>

            <div id='notes' class="col-sm-4 col-sm-offset-1">
            </div>
        </div>
    </div>


    <script src="js/jupyter-tufte-notes.js"></script>
{%- endblock body %}
</body>

{% block footer %}
</html>
{% endblock footer %}
