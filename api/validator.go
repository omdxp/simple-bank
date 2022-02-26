package api

import (
	"github.com/Omar-Belghaouti/simple-bank/util"
	"github.com/go-playground/validator/v10"
)

var validCurrency validator.Func = func(fl validator.FieldLevel) bool {
	return util.IsSupportedCurrency(fl.Field().String())
}
