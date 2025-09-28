extends Node

# enum for ports
enum Cords {
	ETHERNET,
	VGA,
	USBA,
	COUNT
}

var player_health: int
var player_cord: Cords
