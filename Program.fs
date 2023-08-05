open EdgeDB

let config =
    EdgeDBClientPoolConfig(SchemaNamingStrategy = INamingStrategy.DefaultNamingStrategy, ExplicitObjectIds = false)

let dbClient = EdgeDBClient(config)

type Settings =
    { uniqueId: string
      baz: int
      bar: bool }

type Foo = { uniqueId: string; thing: bool }

[<EntryPoint>]
let main _ =
    task {
        try
            do! dbClient.ExecuteAsync("""insert Settings unless conflict on .uniqueId;""")
            do! dbClient.ExecuteAsync("""insert Foo unless conflict on .uniqueId;""")

            let! settings = dbClient.QuerySingleAsync<Option<Settings>>("""select Settings limit 1""")

            let! foo = dbClient.QuerySingleAsync<Option<Foo>>("""select Foo limit 1""")

            ()
        with err ->
            printfn "Error: %A" err
    }
    |> Async.AwaitTask
    |> Async.RunSynchronously


    0
