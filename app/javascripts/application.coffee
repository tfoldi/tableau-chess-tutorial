# Main CoffeeScript File

initViz = ->
  containerDiv = document.getElementById('vizContainer')
  url = 'https://public.tableau.com/views/Chess_3/Board'
  options =
    hideTabs: true
    onFirstInteractive: ->
      console.log 'Run this code when the viz has finished loading.'
  viz = new tableau.Viz(containerDiv, url, options)

# use jquery to load initViz when page is loaded
$(initViz)
