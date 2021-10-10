extends KinematicBody2D

var particle_tex_1 = preload("res://particle/sprites/particle_1.png")
var particle_tex_2 = preload("res://particle/sprites/particle_2.png")
var particle_tex_3 = preload("res://particle/sprites/particle_3.png")
var particle_tex_4 = preload("res://particle/sprites/particle_4.png")
var particle_tex_5 = preload("res://particle/sprites/particle_5.png")
var particle_tex_6 = preload("res://particle/sprites/particle_6.png")
var particle_tex_7 = preload("res://particle/sprites/particle_7.png")
var particle_tex_8 = preload("res://particle/sprites/particle_8.png")
var particle_tex_9 = preload("res://particle/sprites/particle_9.png")

export (float) var hours = 1.0
export (String) var type = "happy"

onready var sprite = get_node("Sprite")
onready var collision_shape = get_node("CollisionShape2D").shape

var rotation_speed = PI
var base_speed = 50
var speed = 0
var direction = Vector2()
var velocity = Vector2()

func init_texture_and_speed():
	match type:
		"happy":
			sprite.set_texture(particle_tex_1)
			speed = base_speed
		"hype":
			sprite.set_texture(particle_tex_2)
			speed = base_speed * 5
		"unproductive":
			sprite.set_texture(particle_tex_3)
			speed = base_speed * 0.5
		"focused":
			sprite.set_texture(particle_tex_4)
			speed = base_speed * 0.7
		"calm":
			sprite.set_texture(particle_tex_5)
			speed = base_speed
		"fresh":
			sprite.set_texture(particle_tex_6)
			speed = base_speed
		"antsy":
			sprite.set_texture(particle_tex_7)
			speed = base_speed * 2
		"angry":
			sprite.set_texture(particle_tex_8)
			speed = base_speed * 2
		"tired":
			sprite.set_texture(particle_tex_9)
			speed = base_speed * 0.15

func init_sprite_radius():
	sprite.scale *= hours * 0.8

func randomize_direction():
	direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	velocity = speed * direction

func _ready():
	init_texture_and_speed()
	init_sprite_radius()
	randomize()
	randomize_direction()
	
#	sprite.position = Vector2(0, -15 * hours)
#	rotation_speed = PI / hours * 2

#func _process(delta):
#	rotation += rotation_speed * delta

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if type == "antsy":
#			randomize_direction()
			velocity *= -1
		else:
			velocity = velocity.bounce(collision.normal)
