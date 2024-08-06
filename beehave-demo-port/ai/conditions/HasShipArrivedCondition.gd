extends ConditionLeaf

var ship: Ship

var arrived = false

func tick(actor, blackboard):
	if arrived or not ship.departed:
		return SUCCESS
	return FAILURE

func set_ship(s):
	ship = s
	if not ship.arrive.is_connected(_on_arrive):
		ship.arrive.connect(_on_arrive)
	if not ship.depart.is_connected(_on_depart):
		ship.depart.connect(_on_depart)
		
func _on_arrive():
	self.arrived = true
	
func _on_depart():
	self.arrived = false
