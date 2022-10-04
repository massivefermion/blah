import gleam/int
import blah/fa/string
import blah/locales/fa/address
import blah/utils.{get_random_item, join}

pub fn country() {
  assert Ok(country) = get_random_item(address.countries)
  country
}

pub fn province() {
  assert Ok(state) = get_random_item(address.provinces)
  state
}

pub fn city() {
  assert Ok(city) = get_random_item(address.cities)
  city
}

pub fn street() {
  let nonce = int.random(4, 2048)

  assert Ok(prefix) = get_random_item(address.street_prefixes)

  assert Ok(street) = get_random_item(address.streets)

  let street =
    [prefix, street]
    |> join(" ")

  case nonce % 2 {
    0 -> street

    1 -> {
      assert Ok(prefix) = get_random_item(address.alley_prefixes)
      assert Ok(alley) = get_random_item(address.streets)
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
  assert Ok(direction) = get_random_item(address.directions)
  direction
}

pub fn full_address() {
  [street(), floor(), unit()]
  |> join("، ")
}
