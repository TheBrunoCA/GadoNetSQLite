## SQLite client for GadoNet.
class_name GadoSQLite
extends GadoNetClient

const PROVIDER_NAME = "Microsoft.Data.Sqlite"


## Helper to create a GadoSQLite instance from a file path.
static func from_path(path: String) -> GadoSQLite:
	return GadoSQLite.new("Data Source=" + path)


## Initializes the SQLite client with a connection string.
func _init(connection_string: String) -> void:
	super._init(PROVIDER_NAME, connection_string)


func _get_csharp_factory_scripts() -> CSharpScript:
	return preload("uid://vo1gs53st65d")
