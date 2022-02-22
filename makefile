create_migration:
	echo "Creating migration..."
	migrate create -ext sql -dir db/migration -seq init_schema
	echo "Migration created"

migrateup:
	echo "Running migrations..."
	migrate -path db/migration -database "postgres://omar:ramo@localhost:5432/simple_bank?sslmode=disable" -verbose up
	echo "Migrations run"

migratedown:
	echo "Rolling back migrations..."
	migrate -path db/migration -database "postgres://omar:ramo@localhost:5432/simple_bank?sslmode=disable" -verbose down
	echo "Migrations rolled back"

createdb:
	echo "Creating database..."
	docker exec -it pg createdb --username=omar --owner=omar simple_bank
	echo "Database created"

dropdb:
	echo "Dropping database..."
	docker exec -it pg dropdb --username=omar simple_bank
	echo "Database dropped"

postgres:
	echo "Starting postgres..."
	docker run -d --name pg -p 5432:5432 -e POSTGRES_PASSWORD=ramo -e POSTGRES_USER=omar postgres:14-alpine
	echo "Postgres started"

sqlc:
	echo "Starting sqlc..."
	sqlc generate
	echo "Sqlc started"

test:
	echo "Running tests..."
	go test -v -cover ./...
	echo "Tests run"
	
.PHONY: createdb dropdb migrateup migratedown postgres sqlc test