import gleam/int
import gleam/string
import blah/fr/name
import blah/locales/fr/address.{type Department}
import blah/utils.{get_random_int, get_random_item}
import blah/string as blah_string

pub fn country() -> String {
  get_random_item(address.countries)
}

pub fn departement() -> Department {
  get_random_item(address.departments)
}

pub fn city() -> String {
  get_random_item(address.cities)
}

pub fn street() -> String {
  let street_type = case get_random_int(0, 10) {
    // most of French street names starts with "rue"        
    i if i < 8 -> "rue"
    _ -> get_random_item(address.streets)
  }
  [street_type, name.last_name()]
  |> string.join(" ")
}

pub fn postal_code() -> String {
  get_random_int(1000, 98_890)
  |> int.to_string()
  |> string.pad_left(to: 5, with: "0")
}

pub fn direction() -> String {
  get_random_item(address.directions)
}

pub fn direction_code() -> String {
  get_random_item(address.direction_codes)
}

pub fn full_address() -> String {
  [blah_string.with_pattern("%d%d"), street(), postal_code(), city()]
  |> string.join(" ")
}

pub fn time_zone() -> String {
  get_random_item(address.time_zones)
}
