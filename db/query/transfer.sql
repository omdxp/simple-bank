-- name: CreateTransfer :one
INSERT INTO "transfers" (
    from_account_id,
    to_account_id,
    ammount
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetTransfer :one
SELECT * FROM "transfers" 
WHERE id = $1
LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM "transfers"
ORDER BY id ASC
LIMIT $1
OFFSET $2;

-- name: UpdateTransfer :one
UPDATE "transfers"
SET ammount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM "transfers"
WHERE id = $1;