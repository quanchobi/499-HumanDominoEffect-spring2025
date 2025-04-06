extends KinematicBody2D

#added in Fall 2024

# edits made in Spring 2025.
# Sprite sheet for player was taken from
# https://kenmi-art.itch.io/cute-fantasy-rpg

# check list:
# - sprite animation facing direction from idle appears correctly
# - sprite walking animation does not work correctly
# - sprite turning while already holding a vertical movement remains vertical

#variables to help with player movement
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

onready var animated_sprite = $AnimatedSprite

func _ready():
	# Set initial sprite direction
	direction = Vector2(0, 1) # Start facing down

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		
	if Input.is_action_pressed("Down"):
		velocity.y += 1
		direction = Vector2(0, 1)
		
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		
	update_animation()
	# to make sure the player's speed is normal when going in odd directions (diagonally)
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)

func update_animation():
	if velocity.length() == 0:
		# Player is idle
		if direction.y < 0:
			animated_sprite.play("idle_up")
		elif direction.y > 0:
			animated_sprite.play("idle_down")
		elif direction.x != 0:
			animated_sprite.play("idle_side")
			animated_sprite.flip_h = direction.x < 0
	else:
		# Player is moving
		if abs(velocity.y) > abs(velocity.x):
			# Vertical movement is dominant
			if velocity.y < 0:
				animated_sprite.play("walk_up")
			else:
				animated_sprite.play("walk_down")
		else:
			# Horizontal movement is dominant
			animated_sprite.play("walk_side")
			animated_sprite.flip_h = velocity.x < 0
			
#needed for maintaining collision control with objects in the level
func _physics_process(delta):
	read_input()
