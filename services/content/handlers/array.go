package handlers

import (
	"database/sql/driver"
	"fmt"
	"strings"
)

// stringArray is a []string that implements sql.Scanner for PostgreSQL text[] columns.
type stringArray []string

func (a *stringArray) Scan(src interface{}) error {
	if src == nil {
		*a = nil
		return nil
	}
	s, ok := src.(string)
	if !ok {
		b, ok2 := src.([]byte)
		if !ok2 {
			return fmt.Errorf("stringArray: unexpected type %T", src)
		}
		s = string(b)
	}
	s = strings.TrimPrefix(s, "{")
	s = strings.TrimSuffix(s, "}")
	if s == "" {
		*a = []string{}
		return nil
	}
	parts := strings.Split(s, ",")
	out := make([]string, len(parts))
	for i, p := range parts {
		out[i] = strings.Trim(p, `"`)
	}
	*a = out
	return nil
}

func (a stringArray) Value() (driver.Value, error) {
	if a == nil {
		return nil, nil
	}
	quoted := make([]string, len(a))
	for i, v := range a {
		quoted[i] = `"` + strings.ReplaceAll(v, `"`, `\"`) + `"`
	}
	return "{" + strings.Join(quoted, ",") + "}", nil
}
