import gleam/string
import blah/locales/fa/address
import blah/utils.{get_random_int, get_random_item}
import blah/fa/string as blah_string

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
  let nonce = get_random_int(4, 2048)

  let prefix = get_random_item(address.street_prefixes)

  let street = get_random_item(address.streets)

  let street =
    [prefix, street]
    |> string.join(" ")

  case nonce % 2 {
    0 -> street

    _ -> {
      let prefix = get_random_item(address.alley_prefixes)
      let alley = get_random_item(address.streets)
      let alley =
        [prefix, alley]
        |> string.join(" ")
      [street, alley]
      |> string.join("، ")
    }
  }
}

pub fn postal_code() {
  blah_string.with_pattern("%n%d%d%d%d-%n%d%d%d%d")
}

pub fn floor() {
  let length = get_random_int(1, 2)
  let floor = blah_string.numeric(length)
  ["طبقه‌ی", floor]
  |> string.join(" ")
}

pub fn unit() {
  let length = get_random_int(1, 3)
  let unit = blah_string.numeric(length)
  ["واحد", unit]
  |> string.join(" ")
}

pub fn direction() {
  get_random_item(address.directions)
}

pub fn full_address() {
  [street(), floor(), unit()]
  |> string.join("، ")
}
