extends Control

@export var mainScene: PackedScene

func _ready():
	$ColorRect/MoneyLabel.text = '$%s' % data.money
	$ColorRect/DayLabel.text = 'Day: %s' % data.day
	$ColorRect/Control/VBoxContainer/btnStartDay.text = 'Start Day %s' % data.day

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_start_day_pressed():
	get_tree().change_scene_to_packed(mainScene)
