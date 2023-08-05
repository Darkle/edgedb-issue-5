CREATE MIGRATION m1nm762vpt7vmw4ogxyl2etxmnpytdts26ruvbizql5jef5lq2lfcq
    ONTO initial
{
  CREATE TYPE default::Foo {
      CREATE REQUIRED PROPERTY thing: std::bool {
          SET default := true;
      };
      CREATE REQUIRED PROPERTY uniqueId: std::str {
          SET default := 'foo';
          CREATE CONSTRAINT std::exclusive;
      };
  };
  CREATE TYPE default::Settings {
      CREATE REQUIRED PROPERTY bar: std::bool {
          SET default := true;
      };
      CREATE REQUIRED PROPERTY baz: std::int32 {
          SET default := 2;
          CREATE CONSTRAINT std::min_value(1);
      };
      CREATE REQUIRED PROPERTY uniqueId: std::str {
          SET default := 'settings';
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
