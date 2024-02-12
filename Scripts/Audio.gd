extends Node

signal _on_background_music_changed

var tracked_nodes = {}
var audio_ids = 0

func _process(delta):
	for node in tracked_nodes:
		if !tracked_nodes[node].node.is_playing():
			if tracked_nodes[node].looping:
				tracked_nodes[node].node.play()
			else:
				stop_sfx(node)

func play_sfx(audio, loop=false):
	var audio_resource = load("res://Assets/Audio/%s.wav" % audio)
	if audio_resource == null:
		push_error("Audio::play_sfx - Resource not found: %s" % audio)
		return
	var root = get_tree().root.get_child(0)
	var audio_node = AudioStreamPlayer.new()
	root.add_child(audio_node)
	audio_node.stream = audio_resource
	audio_node.play()
	audio_ids = audio_ids + 1
	tracked_nodes[audio_ids] = {
		"node": audio_node,
		"looping": loop
	}
	return audio_ids

func stop_sfx(audio_id):
	tracked_nodes[audio_id].node.queue_free()
	tracked_nodes.erase(audio_id)
