extends Control

@export var nextSlide: PackedScene

func _on_timer_timeout():
	if $DayTimer.value > 0:
		$DayTimer.value -= 1
		var val = int($TimerLabel.text)
		$TimerLabel.text = str(val - 1)


func _on_button_pressed():
	get_tree().change_scene_to_packed(nextSlide)
