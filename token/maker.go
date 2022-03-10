package token

import "time"

// Maker is an interface for managing tokens
type Maker interface {
	// CreateToken creates a new token for a specific username and duration
	CreateToken(username string, duration time.Duration) (string, error)

	// VerifyToken verifies a token and returns the payload data if valid
	VerifyToken(token string) (*Payload, error)
}
