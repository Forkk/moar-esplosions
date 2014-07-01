# File containing the spark line class.

# A line from a spark or explosion.
class window.SparkLine extends Entity
    constructor: (@x, @y, @length, @angle, @time) ->
        # The amount of time this line has existed.
        @elapsed = 0

    update: (tdelta) ->
        @elapsed += tdelta
        if @elapsed >= @time
            @kill()

    render: (ctx) ->
        # The length percentage is elapsed time over total time.
        # A fraction representing the percentage of the line's life that has elapsed.
        pcnt = @elapsed / @time
        # The line end offset as a fraction of the length.
        pcnt_end = 1 - Math.pow(1 - pcnt, 2)
        # The line start offset as a fraction of the length.
        pcnt_start = Math.pow(pcnt, 2)

        # Now for the rotation.
        # First, we'll calculate the offset of the line's start and end points.
        start_offset = @length * pcnt_start
        end_offset = @length * pcnt_end

        # Find our side ratios.
        xfactor = Math.cos(@angle)
        yfactor = Math.sin(@angle)

        # Next, we'll find the coordinates of the start and end points.
        start_offs_x = xfactor * start_offset
        start_offs_y = yfactor * start_offset
        end_offs_x = xfactor * end_offset
        end_offs_y = yfactor * end_offset

        ctx.beginPath()
        ctx.moveTo @x + start_offs_x, @y + start_offs_y
        ctx.lineTo @x + end_offs_x, @y + end_offs_y
        ctx.stroke()

