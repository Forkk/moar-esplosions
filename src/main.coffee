$(document).ready( ->
	# Find the canvas.
	canvas = $("#esplosions")[0]
	ctx = canvas.getContext('2d')

	# Create the world.
	world = new World() # A whole new wooooooooorrrllllld!
	window.world = world # Mainly for debugging.

	# Handle mouse clicks.
	$("#esplosions").click((e) ->
		offset = $(this).offset()
		clickX = e.pageX - offset.left
		clickY = e.pageY - offset.top
		# line = new SparkLine(clickX, clickY, 80, Math.PI * 2 * Math.random(), 200)
		rot_offset = Math.random()
		line_count = Math.floor(Math.random() * 10 % 5 + 3)
		for i in [0..line_count]
			line = new SparkLine(clickX, clickY, 80, (Math.PI * 2 * (i/line_count)) + rot_offset, 200)
			world.add_entity line
	)

	# Tick and render.
	# TODO: Find a better way to do this. Need to be able to determine time since last tick.
	tick_time = 5
	setInterval( ->
		world.update_entities tick_time
		ctx.clearRect(0, 0, canvas.width, canvas.height) # TODO: Check width and height from canvas.
		world.render_entities ctx
		world.remove_dead_entities()
	, tick_time)
)

