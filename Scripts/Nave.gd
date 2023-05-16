extends Area2D

var sprite_tiro = preload("res://Cenas/tiro.tscn")
var velocidade_tiro = 500
var espera = 0.2
var disparo = 0

var velocidade = 300; # velocidade da nave em pixels/segundo

func _ready():
	set_process(true)
	pass

func _process(delta):
	var d = 0
	var e = 0 
	
	if Jogo.vidas <= 0:
		Jogo.vidas = 3
		Jogo.pontos = 0
		get_tree().reload_current_scene() # reinicia a cena atual
	
	if Input.is_action_pressed("Direita"):
		d = 1 
	
	if Input.is_action_pressed("Esquerda"):
		e = -1
	
	if get_pos().x > (800 - 50):
		d = 0

	if get_pos().x < 50:
		e = 0
	
	set_pos(get_pos() + Vector2(velocidade, 0) * delta * (d + e))
	pass
	
	if Input.is_action_pressed('Atirar'):
		if disparo <= 0:
			var tiro = sprite_tiro.instance()
			tiro.set_global_pos(get_global_pos())
			get_node('../').add_child(tiro)
			disparo = espera
	pass
	if disparo > 0:
		disparo -= delta
	pass

func _on_Nave_area_enter( area ):
	if area.is_in_group(Jogo.METEORO):
		Jogo.vidas -= 1 # retiramos uma vida quando somos acertados
		area.queue_free()
	pass # replace with function body
