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
