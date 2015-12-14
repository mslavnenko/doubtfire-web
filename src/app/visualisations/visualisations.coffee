angular.module('doubtfire.visualisations', [
  'doubtfire.visualisations.summary-task-status-scatter'
  'doubtfire.visualisations.progress-burndown-chart'
  'doubtfire.visualisations.alignment-bar-chart'
  'doubtfire.visualisations.alignment-bullet-chart'
  'doubtfire.visualisations.student-task-status-pie-chart'
])

.factory('Visualisation', ($timeout) ->
  Visualisation = (type, opts, conf) ->
    DEFAULT_OPTS =
      objectequality: yes
      interactive: yes
      # tooltips: yes
      showValues: yes
      showXAxis: yes
      showYAxis: yes
      showLegend: yes
      transitionDuration: 500
      duration: 500
      height: 600
      color: [
        "#1f77b4"
        "#ff7f0e"
        "#2ca02c"
        "#d62728"
        "#9467bd"
        "#8c564b"
        "#e377c2"
        "#7f7f7f"
        "#bcbd22"
        "#17becf"
      ]

    DEFAULT_CONF = {
      visible: true, # default: true
      extended: false, # default: false
      disabled: false, # default: false
      autorefresh: true, # default: true
      refreshDataOnly: true, # default: true
      deepWatchOptions: true, # default: true
      deepWatchData: false, # default: false
      deepWatchConfig: true, # default: true
      debounce: 10 # default: 10
    }

    dirtyOpts = angular.extend {}, DEFAULT_OPTS, opts
    dirtyOpts.type = type

    dirtyConf = angular.extend {}, DEFAULT_CONF, conf

    [ { chart: dirtyOpts },  dirtyConf ]

  Visualisation.refreshAll = ->
    $timeout -> window.dispatchEvent new Event('resize')

  Visualisation
)
