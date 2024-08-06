extends BeehaveTree

@export var stash_area_path: NodePath

@onready var stash_area = get_node(stash_area_path)
@onready var has_stash_free_space = $"%HasStashFreeSpace"
@onready var walk_to_stash_action = $"%WalkToStashAction"
@onready var place_box_action = $"%PlaceBoxAction"

func _ready():
	# ensure _ready() has been finished everywhere else
	await get_tree().root.ready
	has_stash_free_space.stash_area = stash_area
	walk_to_stash_action.stash_area = stash_area
	place_box_action.stash_area = stash_area
