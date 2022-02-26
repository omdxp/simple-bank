package util

import (
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().UnixNano())
}

// RandomInt returns a random int in the range [min, max]
func RandomInt(min, max int64) int64 {
	return rand.Int63n(max-min+1) + min
}

// RandomString returns a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)
	for i := 0; i < n; i++ {
		sb.WriteByte(alphabet[rand.Intn(k)])
	}
	return sb.String()
}

// RandomOwner returns a random owner name
func RandomOwner() string {
	return RandomString(6)
}

// RandomMoney returns a random money amount
func RandomMoney() int64 {
	return RandomInt(1, 1000)
}

// RandomCurrency returns a random currency
func RandomCurrency() string {
	currencies := []string{"USD", "EUR", "CAD"}
	return currencies[rand.Intn(len(currencies))]
}

// RandomEmail returns a random email
func RandomEmail() string {
	return RandomString(6) + "@email.com"
}
