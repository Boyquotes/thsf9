extends RigidBody2D

func throw_beer(force):
	apply_impulse(Vector2(), Vector2(force, 0))
