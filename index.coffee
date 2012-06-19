jQuery ->
  dd = ->
    $("#drag-item").draggable
      helper: "clone"
    # $("t").droppable
    #   over:
    $(".rim").droppable
      tolerance: "touch"
      over: (e, ui) ->
        $dropped_th = $(this)
        $dragged_div = ui.draggable
        $dropped_th
          .text($dropped_th.text())
          .animate(
            width: 100
            100
          )
      out: ->
        $(this)
          .text("")
          .animate(
            width: 10
            100
          )
      drop: (e, ui) ->
        text = ui.draggable.text()
        n = $(this).attr("n")
        xs.splice(n, 0, text)
        render()

  xs = ["hoge", "fuga", "piyo"]

  render = ->
    table = $("<table/>").attr("id", "t")
    _(3).times ->
      $tr = $("<tr/>")
      $tr.append $("<td/>").addClass("rim").attr("n", 0)
      _(xs).each (x, n) ->
        $tr.append $("<td/>").text(x)
        $tr.append $("<td/>").addClass("rim").attr("n", n+1)
      table.append $tr
    $("#t").replaceWith table

    dd()

  render()


