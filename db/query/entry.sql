-- name: CreateEntry :one
INSERT INTO "entries" (
    account_id,
    ammount
) VALUES (
    $1, $2
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM "entries" 
WHERE id = $1
LIMIT 1;

-- name: ListEntries :many
SELECT * FROM "entries"
ORDER BY id ASC
LIMIT $1
OFFSET $2;

-- name: UpdateEntry :one
UPDATE "entries"
SET ammount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteEntry :exec
DELETE FROM "entries"
WHERE id = $1;