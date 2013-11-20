jump = () ->
  #swap this for loading-bar asap
  $.get '/random',(data)->
    $("#code_wrapper .code").html("<pre><code class='prettyprint'>"+data.content+"</code></pre>")
    $("#code_wrapper .title").text(data.path)
    prettyPrint()

$(document).ready ()->
  $(".jump").loadingbar {
    target: "",
    dataType: "json",
    success: (data)->
      $("#code_wrapper .code").html("<pre><code class='prettyprint'>"+data.content+"</code></pre>")
      $("#code_wrapper .title").text(data.path)
      prettyPrint()
  }
  $(".jump").tooltip({
    title: "Review some other code!",
    placement: "bottom",
    delay: { show: 500, hide: 0 }
  })
  jump()