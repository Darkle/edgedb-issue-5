module default {
  type Settings {
    required uniqueId: str {
      default := "settings"; 
      constraint exclusive;
    };
    required baz: int32 {
      default := 2;
      constraint min_value(1);
    };
    required bar: bool {
      default := true;
    };
  };
  type Foo {
    required uniqueId: str {
      default := "foo"; 
      constraint exclusive;
    };
    required thing: bool {
      default := true;
    };
  }
}
