extends Area2D
	
@export var speed = 400 
var screen_size 
signal hit
func _ready() -> void:
	pass 
	
	var screen_size 
	screen_size = get_viewport_rect().size
	hide()

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 10
	if Input.is_action_pressed("move_left"):
		velocity.x -= 10
	if Input.is_action_pressed("move_down"):
		velocity.y += 10
	if Input.is_action_pressed("move_up"):
		velocity.y -= 10
 
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
		if velocity.x != 0: 
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D
		elif  velocity.y != 0:
			$AnimatedSprite2D.animation = "up"
			$AnimatedSprite2D.flip_v = velocity.y > 0	
			
			
		
		pass
		
		



func _on_body_entered(body: Node2D) -> void:
	hide() 
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	pass 

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
