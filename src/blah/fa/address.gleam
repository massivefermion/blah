import gleam/int
import blah/fa/string
import blah/locales/fa/address
import blah/utils.{get_random_item, join}

pub fn country() {
  get_random_item(address.countries)
}

pub fn province() {
  get_random_item(address.provinces)
}

pub fn city() {
  get_random_item(address.cities)
}

pub fn street() {
  let nonce = int.random(4, 2048)

  let prefix = get_random_item(address.street_prefixes)

  let street = get_random_item(address.streets)

  let street =
    [prefix, street]
    |> join(" ")

  case nonce % 2 {
    0 -> street

    1 -> {
      let prefix = get_random_item(address.alley_prefixes)
      let alley = get_random_item(address.streets)
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
  get_random_item(address.directions)
}

pub fn full_address() {
  [street(), floor(), unit()]
  |> join("، ")
}
