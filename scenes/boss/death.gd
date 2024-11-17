extends State


func enter():
	super.enter()
	anime.play("death")
	
func stage_ended():
	anime.play("stage_end")
