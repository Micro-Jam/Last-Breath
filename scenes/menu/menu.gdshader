shader_type canvas_item;

void vertex() {
	UV.x += TIME * .02;
	UV.y -= TIME * .02;
}


