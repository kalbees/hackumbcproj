extends Control

const DEF_HP: int = 3

@onready var hearts: Control = $Hearts

var hp_list: Array = []
var curr_port: PlayerDataManager.Cords
var hp: int 

var vga_texture
var ethernet_texture
var usba_texture

# initialize ui
func _ready() -> void:
	
	for child in hearts.get_children():
		if child is TextureRect:
			hp_list.append(child)
	hp = DEF_HP
	# connect signals
	SignalBus.connect("player_hp_changed", update_hp)
	SignalBus.connect("player_change_port", update_port)
	# set textures for cords
	vga_texture = load("res://assets/ui/ui_vga1.png")
	ethernet_texture = load("res://assets/ui/ui_ethernet1.png")
	usba_texture = load("res://assets/ui/ui_usba1.png")

# change ui to fit hp changes 
func update_hp(changed: int) -> void: 
	hp = changed
	var hp_counter = 0
	for heart in hp_list:
		if hp_counter < hp:
			heart.show()
		else:
			heart.hide()
		hp_counter += 1

# change ui to fit port changes 
func update_port(cord: PlayerDataManager.Cords):
	curr_port = cord
	if curr_port == PlayerDataManager.Cords.ETHERNET:
		$Control/TextureRect.texture = ethernet_texture
	if curr_port == PlayerDataManager.Cords.VGA:
		$Control/TextureRect.texture = vga_texture
	if curr_port == PlayerDataManager.Cords.USBA:
		$Control/TextureRect.texture = usba_texture
