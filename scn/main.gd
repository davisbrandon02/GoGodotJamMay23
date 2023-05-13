extends Node2D

const mapSize:= Vector2(1000, 1000)
const leaves: int = 500

@export var leafScene: PackedScene
@export var leafSprites: Array[Texture]
var leafColors: Array[Color] = [Color.DARK_GREEN, Color.FOREST_GREEN, Color.INDIAN_RED, Color.ORANGE_RED, Color.CORAL, Color.DARK_GOLDENROD]
func _ready():
	for i in leaves:
		var leaf = leafScene.instantiate()
		var sprite: Sprite2D = leaf.get_node('Sprite2D')
		sprite.texture = leafSprites[randi() % leafSprites.size()]
		sprite.modulate = leafColors[randi() % leafColors.size()]
		sprite.modulate.a = 0.75
		sprite.scale = Vector2(.025, .025)
		sprite.rotation_degrees = randf_range(-180, 180)
		leaf.position = Vector2(randf_range(0, mapSize.x), randf_range(0, mapSize.y))
		$Leaves.add_child(leaf)

