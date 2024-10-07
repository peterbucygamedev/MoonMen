extends CheckButton

func _on_toggled(toggled_on):
	GameManager.pickUpsOn = toggled_on
	print(GameManager.pickUpsOn)
