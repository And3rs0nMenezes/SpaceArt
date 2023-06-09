extends Area2D

var velocidade = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0,-1) * velocidade * delta)
	if get_pos().y < -30:
		free()
	pass

func _on_tiro_area_enter( area ):
	if area.is_in_group(Jogo.METEORO): # identificaremos nosso meteoro por grupo
		area.queue_free() # destruímos o meteoro
		Jogo.pontos += 10 #cada meteoro destruído o jogador ganha 10 pontos
	pass # replace with function body
	

