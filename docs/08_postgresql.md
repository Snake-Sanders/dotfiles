# Postgresql

This will install probably v14

`brew install postgresql`

postgis will allow use geocoordinate data

`brew install postgis`

## Configuration

create the user

`/opt/homebrew/bin/createuser -s postgres`
`brew services restart postgresql`

- Note the db is not created yet, you can create wothing the project with:

`mix ecto.create`

## Troubleshooting

`brew upgrade` can mess up your installation creating a new service with different
name.

- `postgres` (old)
- `postgresql@14` (new)

```
```sh
ls -lh /opt/homebrew/var | grep postgres                                                                                                                                                            
drwx------  25 mac  admin   800B Apr 16 08:19 postgres
drwx------@ 26 mac  admin   832B Apr 16 08:01 postgresql@14
```

when checking the running services you will see the new one running:

`brew services list`

and if you try to connect with Dbeaver you dont have access because the user was not created yet.

create access by adding the user, your OS user, (check it with `whoami`)

`createuser -s postgres -U <os-username>`
[ref](https://enrq.me/dev/2021/01/13/fix-role-postgres-does-not-exist/)

Migrating the data

Stop the new db

`brew services stop postgresql@14`

Start Postgres using the old data directory manually

`/opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgres`

Leave that running in one terminal.
In another terminal, dump all databases

`/opt/homebrew/opt/postgresql@14/bin/pg_dumpall -U postgres > ~/old_pg_backup.sql`

Kill the old Postgres (Ctrl+C in the terminal where it's running)

Start the new service again

`brew services start postgresql@14`

Import the dump into the new cluster

`psql -U postgres < ~/old_pg_backup.sql`

Verification

- Open DBeaver — you should now see your old databases and tables again
- Phoenix app should work like before (if it connects with the same user/db)
- You can confirm the restore worked with:

psql -U postgres -l

Cleanup

delete the old db

rm -rf /opt/homebrew/var/postgres
