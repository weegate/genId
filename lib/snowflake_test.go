//@author wuyong
//@date   2018/2/3
//@desc

package lib

import (
	"testing"
)

func TestSnowflake_Generate(t *testing.T) {
	sf, err := NewSnowflake(123)
	if err != nil {
		t.Error("err: %s", err.Error())
	} else {
		genId := sf.Generate()
		t.Log("genId: %d", genId)
	}

}

func BenchmarkSnowflake_Generate(b *testing.B) {
	b.StopTimer()
	sf, err := NewSnowflake(123)
	if err != nil {
		b.Error("err: %s", err.Error())
	}
	b.StartTimer()

	for i := 0; i < b.N; i++ {
		sf.Generate()
		//b.Log("genId: %d", genId)
	}

}

func BenchmarkSnowflake_Generate2(b *testing.B) {
	b.StopTimer()
	sf, err := NewSnowflake(123)
	if err != nil {
		b.Error("err: %s", err.Error())
	}
	b.StartTimer()
	for i := 0; i < b.N; i++ {
		sf.Generate()
		//b.Log("genId: %d", genId)
	}

}
