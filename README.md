![blah](https://raw.githubusercontent.com/massivefermion/blah/main/banner.png)

[![Package Version](https://img.shields.io/hexpm/v/blah)](https://hex.pm/packages/blah)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/blah/)

# blah

fake data generation for gleam

## 🎲 Installation

```sh
gleam add blah
```

## 🎲 Usage

```gleam
import blah/name
import blah/time
import blah/other
import blah/internet
import birl
import birl/duration
import bison/object_id

pub type Person {
  Person(
    id: object_id.ObjectId,
    name: String,
    username: String,
    birthday: birl.Time,
    age: Int,
  )
}

pub fn generate_fake_person() {
  let assert Ok(id) = object_id.from_string(other.mongo_object_id())
  let name = name.first_name()
  let birthday = time.past(duration.years(18), duration.years(32))
  let #(age, duration.Year) =
    duration.blur(birl.difference(birl.now(), birthday))

  Person(
    id: id,
    name: name,
    username: internet.username(name),
    birthday: birthday,
    age: age,
  )
}
```