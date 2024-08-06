extends Control

const INFO_TOOLTIP = "press [SPACE] to switch view"

@export var camera_controller_path: NodePath

@onready var camera_controller = get_node(camera_controller_path) as CameraController
@onready var name_label = $VBoxContainer/NameLabel
@onready var profession_label = $VBoxContainer/ProfessionLabel

func _ready():
	camera_controller.on_camera_swap.connect(_on_camera_swap)

func _on_camera_swap(camera:Node2D):
	if camera.get_parent() is Villager:
		name_label.text = camera.get_parent().villager_name
		profession_label.text =  camera.get_parent().villager_profession
	else:
		name_label.text = ""
		profession_label.text = INFO_TOOLTIP
