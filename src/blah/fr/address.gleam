import gleam/int
import gleam/string
import blah/fr/name
import blah/locales/fr/address.{type City, type Department}
import blah/utils.{get_random_int, get_random_item}
import blah/string as blah_string

pub fn country() -> String {
  get_random_item(address.countries)
}

pub fn departement() -> Department {
  get_random_item(address.departments)
}

pub fn city() -> City {
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

pub fn direction() -> String {
  get_random_item(address.directions)
}

pub fn direction_code() -> String {
  get_random_item(address.direction_codes)
}

pub fn full_address() -> String {
  let city = city()
  let postal_code = get_random_item(city.postal_codes)
  [blah_string.with_pattern("%d%d"), street(), postal_code, city.name]
  |> string.join(" ")
}

pub fn time_zone() -> String {
  get_random_item(address.time_zones)
}
