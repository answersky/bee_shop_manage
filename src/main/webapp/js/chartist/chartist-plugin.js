/* ======================================================================
Simple Pie Chart
====================================================================== */
var data = {
    labels: ['Bananas', 'Apples', 'Grapes'],
    series: [20, 15, 40]
};

var options = {
    labelInterpolationFnc: function (value) {
        return value[0]
    }
};

var responsiveOptions = [
    ['screen and (min-width: 640px)', {
        chartPadding: 30,
        labelOffset: 100,
        labelDirection: 'explode',
        labelInterpolationFnc: function (value) {
            return value;
        }
    }],
    ['screen and (min-width: 1024px)', {
        labelOffset: 80,
        chartPadding: 20
    }]
];

/* ======================================================================
Simple Line Chart
====================================================================== */

/* ======================================================================
Line Scatter Diagram with Responsive Settings
====================================================================== */
var times = function (n) {
    return Array.apply(null, new Array(n));
};

var data = times(52).map(Math.random).reduce(function (data, rnd, index) {
    data.labels.push(index + 1);
    data.series.forEach(function (series) {
        series.push(Math.random() * 100)
    });

    return data;
}, {
    labels: [],
    series: times(4).map(function () {
        return new Array()
    })
});

var options = {
    showLine: false,
    axisX: {
        labelInterpolationFnc: function (value, index) {
            return index % 13 === 0 ? 'W' + value : null;
        }
    }
};

var responsiveOptions = [
    ['screen and (min-width: 640px)', {
        axisX: {
            labelInterpolationFnc: function (value, index) {
                return index % 4 === 0 ? 'W' + value : null;
            }
        }
    }]
];


/* ======================================================================
Line Chart with Area
====================================================================== */
new Chartist.Line('#chartist-line-area', {
    labels: [1, 2, 3, 4, 5, 6, 7, 8],
    series: [
        [5, 9, 7, 8, 5, 3, 5, 4]
    ]
}, {
    low: 0,
    showArea: true
});

/* ======================================================================
Bi-polar Line Chart with Area Only
====================================================================== */

/* ======================================================================
Overlapping Bars
====================================================================== */
var data = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    series: [
        [5, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8],
        [3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4]
    ]
};

var options = {
    seriesBarDistance: 10
};

var responsiveOptions = [
    ['screen and (max-width: 640px)', {
        seriesBarDistance: 5,
        axisX: {
            labelInterpolationFnc: function (value) {
                return value[0];
            }
        }
    }]
];



