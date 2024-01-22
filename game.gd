extends Node2D

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func generate_tree():
	var new_tree = preload("res://tree.tscn").instantiate()
	
func _on_spawn_timer_timeout():
	Global.enemy_count += 1
	if Global.enemy_count < 50:
		spawn_mob()

func _on_game_timer_timeout():
	if %SpawnTimer.wait_time > 0.3:
		%SpawnTimer.wait_time -= 0.1

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
