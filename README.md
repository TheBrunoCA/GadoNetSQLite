# GadoSQLite

SQLite provider for GadoNet.

This plugin provides the SQLite implementation for GadoNet, leveraging the `Microsoft.Data.Sqlite` ADO.NET library to offer a robust and efficient database interface for Godot 4.x.

## Requirements

- **Godot 4.x** (.NET/Mono edition).
- **GadoNet** core plugin installed and enabled.

## Installation

1. Install the `gado_net` core plugin and enable it.
2. Copy the `gado_sqlite` directory into your project's `res://addons/` folder or install via asset library.
3. Enable the **GadoSQLite** plugin in **Project Settings > Plugins**.
4. The plugin will attempt to register the necessary NuGet dependencies. Ensure your `.csproj` is updated by rebuilding the project.

## Usage

### Client Initialization

Initialize the SQLite client by providing a connection string or using the helper for file paths.

```gdscript
# Quick initialization from a file path
var db = GadoSQLite.from_path("user://save_data.db")

# Manual initialization with a full connection string
var db = GadoSQLite.new("Data Source=res://database.db;Mode=ReadOnly")
```

### Basic Operations

#### Synchronous Execution

```gdscript
# Non-query execution
var rows = db.execute(
    "INSERT INTO profiles (name, score) VALUES (@name, @score)",
    {"@name": "Player1", "@score": 100}
)

# Query execution
var results = db.query("SELECT * FROM profiles WHERE score > @min", {"@min": 50})
for row in results:
    print(row["name"], ": ", row["score"])

# Scalar execution
var total = db.scalar("SELECT COUNT(*) FROM profiles")
```

#### Asynchronous Execution

Highly recommended for heavy operations to avoid blocking the main thread.

```gdscript
var results = await db.query_async("SELECT * FROM large_table")
```

### Transactions

Manage atomic operations using the transaction API. The transaction object automatically rolls back if it goes out of scope without being committed.

```gdscript
var tx = db.begin_transaction()

tx.execute("UPDATE inventory SET quantity = quantity - 1 WHERE item_id = 5")
tx.execute("INSERT INTO logs (action) VALUES ('Item consumed')")

tx.commit()
```

## License

See LICENCE.md file.
