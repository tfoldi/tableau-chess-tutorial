# Main CoffeeScript File

initViz = ->
  containerDiv = document.getElementById('vizContainer')
  url = 'https://public.tableau.com/views/Chess_3/Board'
  options =
    hideTabs: true
    onFirstInteractive: ->
        viz.addEventListener(
          tableau.TableauEventName.MARKS_SELECTION,
          (marksEvent) ->
            marksEvent.getMarksAsync().then marksSelected)

        viz.addEventListener(
          tableau.TableauEventName.PARAMETER_VALUE_CHANGE,
          (parameterEvent) ->
            parameterEvent.getParameterAsync().then parameterSelected)

        console.log 'Run this code when the viz has finished loading.'

  window.viz = new tableau.Viz(containerDiv, url, options)


parameterSelected = (parameter) ->
  console.log "Paremeter #{parameter.getName()} = #{parameter.getCurrentValue().value}"

marksSelected = (marks) ->
  _.each marks, (mark, idx) ->
    console.log _.reduce mark.getPairs(),
      (memo, pair) ->
        "#{memo} #{pair.fieldName}=#{pair.formattedValue},"
      "Marker: #{idx}, Values:"

# use jquery to load initViz when page is loaded
$(initViz)
