using Godot;
using System;
using System.Data.Common;
using Microsoft.Data.Sqlite;

public partial class GadoNetSqliteFactory : GadoNetFactoryScript
{
    public override DbProviderFactory GetFactoryInstance() => SqliteFactory.Instance;

    public override string GetProviderInvariantName() => "Microsoft.Data.Sqlite";

}
