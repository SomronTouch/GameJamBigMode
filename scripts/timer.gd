extends RichTextLabel
var game_start_time
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	game_start_time = Time.get_ticks_msec()
func _process(_delta):
	set_text(get_time())

func get_time():
	var current_time = Time.get_ticks_msec() - game_start_time
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var miliseconds = current_time%1000/10
	return str("%02d:%02d:%02d" % [minutes,seconds,miliseconds])

