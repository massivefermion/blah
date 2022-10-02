import gleam/int
import blah/fa/string
import blah/locales/fa/address
import blah/utils.{get_random_item, join}

pub fn country() {
  assert Ok(country) =
    address.countries
    |> get_random_item
  country
}

pub fn province() {
  assert Ok(state) =
    address.provinces
    |> get_random_item
  state
}

pub fn city() {
  assert Ok(city) =
    address.cities
    |> get_random_item
  city
}

pub fn street() {
  let nonce = int.random(4, 2048)

  assert Ok(prefix) =
    address.street_prefixes
    |> get_random_item

  assert Ok(street) =
    address.streets
    |> get_random_item

  let street =
    [prefix, street]
    |> join(" ")

  case nonce % 2 {
    0 -> street

    1 -> {
      assert Ok(prefix) =
        address.alley_prefixes
        |> get_random_item
      assert Ok(alley) =
        address.streets
        |> get_random_item
      let alley =
        [prefix, alley]
        |> join(" ")
      [street, alley]
      |> join("، ")
    }
  }
}

pub fn postal_code() {
  string.with_pattern("%n%d%d%d%d-%n%d%d%d%d")
}

pub fn floor() {
  let length = int.random(1, 2)
  let floor = string.numeric(length)
  ["طبقه‌ی", floor]
  |> join(" ")
}

pub fn unit() {
  let length = int.random(1, 3)
  let unit = string.numeric(length)
  ["واحد", unit]
  |> join(" ")
}

pub fn direction() {
  assert Ok(direction) =
    address.directions
    |> get_random_item
  direction
}

pub fn full_address() {
  [street(), floor(), unit()]
  |> join("، ")
}
