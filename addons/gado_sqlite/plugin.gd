@tool
extends GadoNetProviderPlugin


func enable_plugin() -> void:
	pass


func disable_plugin() -> void:
	pass


func _get_nuget_packages() -> Array[Dictionary]:
	return [
		{
			"name": "Microsoft.Data.Sqlite"
		}
	]
