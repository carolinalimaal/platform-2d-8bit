extends Panel

var time  := 0.0
var minutes := 0
var seconds := 0
var miliseconds := 0

func _process(delta: float) -> void:
	time += delta
	miliseconds = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$minutes.text = "%02d:" % minutes
	$seconds.text = "%02d:" % seconds
	$miliseconds.text = "%03d" % miliseconds
