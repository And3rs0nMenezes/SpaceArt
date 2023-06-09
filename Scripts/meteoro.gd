extends Area2D

var velocidade = 350
var rotacao = 0

func _ready():
	add_to_group(Jogo.METEORO) # w adcionamos nosso meteoro a seu devido grupo
	randomize() # reseta a semente
	set_process(true)
	rotacao = rand_range(-3, 3) # randomiza entre -2 e 2 a rotação
	pass
func _process(delta):
	set_pos(get_pos() + Vector2(0, 1) * velocidade * delta)
	rotate(rotacao * delta) # rotaciona o meteoro
	pass