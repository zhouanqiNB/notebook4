var svg = d3.select("#chart1"),
    width = +svg.attr("width"),
    height = +svg.attr("height"),
    innerRadius = 40,// means all bars begins from circle center
    outerRadius = Math.min(width, height) / 2,
    g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var xScale = d3.scaleBand()
    .range([0, 2 * Math.PI])
    .align(0);

var yScale = d3.scaleRadial()
    .range([innerRadius, outerRadius]);

// set the color choices
var colors = d3.scaleOrdinal()
    .range(["#555c8b", "#96ba97", "#eed390", "#f45c4e"]);

d3.csv("data.csv", function (d, i, columns) {
    for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
    d.total = t;
    return d;
}, function (error, data) {
    if (error) throw error;

    xScale.domain(data.map(function (d) { return d.State; }));
    yScale.domain([0, d3.max(data, function (d) { return d.total; })]);
    colors.domain(data.columns.slice(1));

    g.append("g")
        .selectAll("g")
        .data(d3.stack().keys(data.columns.slice(1))(data))
        .enter().append("g")
        .attr("fill", function (d) { return colors(d.key); })
        .selectAll("path")
        .data(function (d) { return d; })
        .enter().append("path")
        .attr("d", d3.arc()
            .innerRadius(function (d) { return yScale(d[0]); })
            .outerRadius(function (d) { return yScale(d[1]); })
            .startAngle(function (d) { return xScale(d.data.State); })
            .endAngle(function (d) { return xScale(d.data.State) + xScale.bandwidth(); })
            .padAngle(0.01)
            .padRadius(innerRadius));

    var label = g.append("g")
        .selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("text-anchor", "middle")
        .attr("transform", function (d) { return "rotate(" + ((xScale(d.State) + xScale.bandwidth() / 2) * 180 / Math.PI - 90) + ")translate(" + innerRadius + ",0)"; });

    label.append("line")
        .attr("x2", -5)
        .attr("stroke", "#000");

    label.append("text")
        .attr("transform", function (d) { return (xScale(d.State) + xScale.bandwidth() / 2 + Math.PI / 2) % (2 * Math.PI) < Math.PI ? "rotate(90)translate(0,16)" : "rotate(-90)translate(0,-9)"; })
        .text(function (d) { return d.State; });

    var yAxis = g.append("g")
        .attr("text-anchor", "middle");

    var yTick = yAxis
        .selectAll("g")
        .data(yScale.ticks(12).slice(1))
        .enter().append("g");

    yTick.append("circle")
        .attr("fill", "none")
        .attr("stroke", "#F0F0F0")
        .attr("stroke-width", 0.5)
        .attr("r", yScale);

    yTick.append("text")
        .attr("y", function (d) { return -yScale(d); })
        .attr("dy", "0.35em")
        .attr("fill", "#000")
        .attr("stroke", "#000")
        .attr("stroke-width", 0.7)
        .text(yScale.tickFormat(5, "s"));

    // to show color->meaning
    var tags = g.append("g")
        .selectAll("g")
        .data(data.columns.slice(1).reverse())
        .enter().append("g")
        .attr("transform", function (d, i) { return "translate(300," + (i - (data.columns.length - 1) / 2) * 20 + ")"; });

    tags.append("rect")
        .attr("width", 18)
        .attr("height", 18)
        .attr("fill", colors);

    tags.append("text")
        .attr("x", 24)
        .attr("y", 9)
        .attr("dy", "0.35em")
        .text(function (d) { return d; });
});


// set the dimensions and margins of the graph
var margin = { top: 60, right: 180, bottom: 60, left: 180 },
    width = 800 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#chart2")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

// Parse the Data
d3.csv("data2.csv", function (data) {

    // List of subgroups = header of the csv files = soil condition here
    var subgroups = data.columns.slice(1)

    // List of groups = species here = value of the first column called group -> I show them on the X axis
    var groups = d3.map(data, function (d) { return (d.group) }).keys()

    // Add X axis
    var x = d3.scaleBand()
        .domain(groups)
        .range([0, width])
        .padding([0.2])
    svg.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x).tickSizeOuter(0));

    // Add Y axis
    var y = d3.scaleLinear()
        .domain([0, 135])
        .range([height, 0]);
    svg.append("g")
        .call(d3.axisLeft(y));

    // color palette = one color per subgroup
    var color = d3.scaleOrdinal()
        .domain(subgroups)
        .range(["#7400B8", "#6930C3", "#5390D9", "#4EA8DE", "#48BFE3", "#64DFDF", "#72EFDD", "#80FFDB"])

    //stack the data? --> stack per subgroup
    var stackedData = d3.stack()
        .keys(subgroups)
        (data)

    // Show the bars
    svg.append("g")
        .selectAll("g")
        // Enter in the stack data = loop key per key = group per group
        .data(stackedData)
        .enter().append("g")
        .attr("fill", function (d) { return color(d.key); })
        .selectAll("rect")
        // enter a second time = loop subgroup per subgroup to add all rectangles
        .data(function (d) { return d; })
        .enter().append("rect")
        .attr("x", function (d) { return x(d.data.group); })
        .attr("y", function (d) { return y(d[1]); })
        .attr("height", function (d) { return y(d[0]) - y(d[1]); })
        .attr("width", x.bandwidth())

    // to show color->meaning
    var tags = svg.append("g")
        .selectAll("g")
        .data(data.columns.slice(1).reverse())
        .enter().append("g")
        .attr("transform", function (d, i) { return "translate(350," + (3.5 + i - (data.columns.length - 1) / 2) * 20 + ")"; });

    tags.append("rect")
        .attr("width", 18)
        .attr("height", 18)
        .attr("fill", color);

    tags.append("text")
        .attr("x", 24)
        .attr("y", 9)
        .attr("dy", "0.35em")
        .text(function (d) { return d; });
})

