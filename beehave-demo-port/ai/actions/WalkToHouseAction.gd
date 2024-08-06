extends ActionLeaf

var target_reached = false

func tick(actor, blackboard):
	if not actor.target_reached.is_connected(_target_reached):
		actor.target_reached.connect(_target_reached)
		actor.reset()
	if self.target_reached:
		self.target_reached = false
		actor.target_reached.disconnect(_target_reached)
		return SUCCESS
	actor.target_location = actor.get_house().get_enter_leave_position()
	return RUNNING

func _target_reached():
	self.target_reached = true
