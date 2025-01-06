extends Node

signal on_data_changed

var peer

var _player_data = {}:
	set(value):
		_player_data = value
		on_data_changed.emit()
		if multiplayer.is_server():
			_send_data_to_clients.rpc(_player_data)

func _ready():
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(_register_new_player)
	PlayerData.on_update_player_data.connect(_client_send_player_data)

func connect_peer():
	peer = ENetMultiplayerPeer.new()

func disconnect_peer():
	_player_data = {}
	peer.close()
	multiplayer.multiplayer_peer = null

func _on_peer_disconnected(id):
	_player_data.erase(id)
	_send_data_to_clients(_player_data)

func _register_new_player():
	_client_send_player_data(PlayerData.package_data())

func _client_send_player_data(player_data):
	"""Send local data to the server"""
	_send_data_to_server.rpc_id(1, player_data)

@rpc("any_peer", "reliable", "call_local")
func _send_data_to_server(player_data):
	"""Receive updated player data from the client"""
	if not multiplayer.is_server():
		return
	_player_data[multiplayer.get_remote_sender_id()] = player_data
	_send_data_to_clients(_player_data)

@rpc("authority", "reliable", "call_remote")
func _send_data_to_clients(player_data):
	_player_data = player_data
