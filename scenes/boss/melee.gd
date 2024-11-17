extends State

func enter():
	super.enter()
	combo()
	
func atk(move ="1"):
	anime.play("atk_"+move)
	await anime.animation_finished
	
	
func combo():
	var move_set = ["1","1","2"]
	for i in move_set:
		await atk(i)
	combo()
func transition():
	if owner.direction.length() > 70:
		get_parent().change_state("follow")
