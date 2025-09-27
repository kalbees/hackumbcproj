class_name Player
extends CharacterBody2D

# exported components
@export var movement: Movement
@export var hitbox: Hitbox 

# onready variables 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
