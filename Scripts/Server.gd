extends Node

signal _on_update_serverside_player_data()

var _player_data = {}
var _is_data_dirty = false
var _is_server_configured = false
var is_hosting = false

func _ready():
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(_enable_data_sending)

func _process(delta):
	if not is_hosting:
		return
	if not _is_server_configured:
		PlayerData._on_update_player_data.connect(_client_send_player_data)
		_player_data[1] = PlayerData.package_data()
		_on_update_serverside_player_data.emit()
		_is_server_configured = true
	if _is_data_dirty:
		_server_update_player_state.rpc(_player_data)
		_is_data_dirty = false

func _on_peer_disconnected(id):
	_player_data.erase(id)
	_is_data_dirty = true

@rpc("authority", "reliable", "call_local")
func _server_update_player_state(player_data):
	_player_data = player_data
	_on_update_serverside_player_data.emit()

func _enable_data_sending():
	PlayerData._on_update_player_data.connect(_client_send_player_data)
	_client_send_player_data()

func _client_send_player_data():
	"""Send local data to the server"""
	_server_receive_player_data.rpc_id(1, PlayerData.package_data())

@rpc("any_peer", "reliable", "call_remote")
func _server_receive_player_data(player_data):
	"""Receive updated player data from the client"""
	if not multiplayer.is_server():
		return
	var sender_id = multiplayer.get_remote_sender_id()
	_player_data[sender_id] = player_data
	_is_data_dirty = true
