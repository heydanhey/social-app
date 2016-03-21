$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
    $(document).ready(function () {

       Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });

        // Build the chart
        $('#chart-container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Weaction Breakdown'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Weactions',
                colorByPoint: true,
                data: [{
                    name: 'UP',
                    y: gon.profile_stats[1],
                    color: '#97CA7E'
                }, {
                    name: 'RIGHT',
                    y: gon.profile_stats[2],
                    color: '#F9B046'
                }, {
                    name: 'DOWN',
                    y: gon.profile_stats[3],
                    color: '#25C3DC'
                }, {
                    name: 'LEFT',
                    y: gon.profile_stats[4],
                    color: '#D34F4F'
                }]
            }]
        });
    });
});



$(function () {
    $('#area-container').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Your weaction profile over time'
        },
        subtitle: {
            text: '...'
        },
        xAxis: {
            allowDecimals: false,
            labels: {
                formatter: function () {
                    return this.value; // clean, unformatted number for year
                }
            }
        },
        yAxis: {
            title: {
                text: 'Number of weactions'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} was swiped <b>{point.y:,.0f}</b><br/>times on day {point.x}'
        },
        plotOptions: {
            area: {
                pointStart: 1,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            name: 'UP',
            data: gon.area_chart[1],
            color: '#97CA7E'
        }, {
            name: 'RIGHT',
            data: gon.area_chart[2],
            color: '#F9B046'
        }, {
            name: 'DOWN',
            data: gon.area_chart[3],
            color: '#25C3DC'
        }, {
            name: 'LEFT',
            data: gon.area_chart[4],
            color: '#D34F4F'
        }]
    });
});

