---
title: A Timeline of Disco
excerpt: This guide will help you see the key dates in the evolution of disco.
layout: post
featured: 50
scripts:
- d3
---

Disco music's peak spanned a significant chunk of the late 1970s. But its origins started before that, and its influences carried on right through into the 1980s.

This timeline shows the development of disco: here are the big events and records of the time, which all formed part of the disco movement.

(This page is a work-in-progress - thanks!)

<div id="timeline"></div>

<script>
// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 30, left: 30},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

d3.json("/timeline.json").then(function(data) { 
    // Set up some constants, will be used later.
    const pxX = 600;
    const pxY = 600;

    const tickFormat = d3.utcFormat("%Y"); // How the axis ticks will be labelled
    const parseDate = d3.utcParse("%Y-%m-%d");

    // The "..." is 'spread syntax': https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
    data = data.map(
        ({ start, end, ...others}) => ({
            ...others, 
            start: parseDate(start),
            end: parseDate(end)
        }));

    console.log(data[0]);
    console.log(data[1]);

    const svg = d3.select("#timeline")
        .append("svg")
            .attr("viewBox", [0, 0, pxX, pxY]);
            // .attr("width", width + margin.left + margin.right)
            // .attr("height", height + margin.top + margin.bottom);

    // Create a scale object for creating axes and positioning elements
    let scaleX = d3.scaleUtc() // Return an object that scales dates/times
        .domain( // specify the shape (domain) of the data
            // d3.extent(data, d => d.parsedDate) // use the minimum and maximum dates in the dataset
            [d3.min(data, d => d.start), d3.max(data, d => d.end)]
        )
        .nice() // extend the input domain so that each end of the scale is a 'round' value
        .rangeRound([margin.left, pxX - margin.right]); // Round the scale, and add margins

    // Create a vertical scale object for placing events vertically
    let scaleY = d3.scalePoint()
        .domain(data.map(d => d.event))
        .rangeRound([margin.top, height - margin.bottom])
        .padding(1);

    // Draw the Top axis (Years)
    const axis = svg.append("g")
        .call(d3.axisTop(scaleX) // draw an axis at the top, using our scale based on event date
            .tickFormat(tickFormat)
            .ticks(d3.utcYear.every(1))
        ) 
        .attr("font-size", 8)
        .attr("transform", `translate(0,${margin.top})`) // Move the axis down, to within the margins of the drawing
        .attr("font-family", "Inter, sans-serif");

    // Draw the event start point
    const startDot = svg.append("g")
        .selectAll("circle")
        .data(data)
        .join("circle")
            .attr("cx", d => scaleX(d.start))
            .attr("cy", d => scaleY(d.event))
            .attr("r", 4)
            .attr("fill", "#cc0000")
            .attr("stroke", "#cc0000");

    // Draw the event timeline
    const timeline = svg.append("g")
        .attr("stroke", "currentColor")
        .attr("stroke-width", 2)
        .selectAll("line")
        .data(data.filter(d => d.end !== null))
        .join("line")
            .attr("x1", d => scaleX(d.start))
            .attr("x2", d => d.end ? scaleX(d.end) : scaleX(d.start))
            .attr("y1", d => scaleY(d.event))
            .attr("y2", d => scaleY(d.event))
            .attr("stroke", "#cc0000");

    // Draw the event end point (if it has one!)
    const endDot = svg.append("g")
        .selectAll("circle")
        .data(data.filter(d => d.end !== null))
        .join("circle")
            .attr("cx", d => scaleX(d.end))
            .attr("cy", d => scaleY(d.event))
            .attr("r", 4)
            .attr("fill", "#cc0000")
            .attr("stroke", "#cc0000");

    const label = svg.append("g")
        .attr("font-family", "inter, sans-serif")
        .attr("font-size", 10)
        .attr("text-anchor", "end")
        .selectAll("text")
        .data(data)
        .join("text") // What does this do?
            .attr("x", d => scaleX(d.start) - 10)
            .attr("y", d => scaleY(d.event))
            .attr("dy", "0.35em")
            .text(d => d.event);

    
});
</script>