//// same as `blah/address`

import gleam/int
import gleam/string
import blah/name
import blah/locales/fr/address
import blah/utils.{get_random_int, get_random_item}
import blah/string as blah_string

pub fn country() {
  get_random_item(address.countries)
}

pub fn country_code() {
  get_random_item(address.country_codes)
}

pub fn alpha3_country_code() {
  get_random_item(address.alpha3_country_codes)
}

pub fn departement() {
  get_random_item(address.departments)
}

pub fn department_number() {
  get_random_item(address.department_numbers)
}

pub fn city() {
  get_random_item(address.cities)
}

pub fn street() {
  let street = get_random_item(address.streets)
  [name.last_name(), street]
  |> string.join(" ")
}

pub fn postal_code() {
  get_random_int(1000, 98890)
  |> int.to_string()
  |> string.pad_left(to: 5, with: "0")   
}

pub fn direction() {
  get_random_item(address.directions)
}

pub fn direction_code() {
  get_random_item(address.direction_codes)
}

pub fn full_address() {
  [blah_string.with_pattern("%n%d%d%d"), street()]
  |> string.join(" ")
}

pub fn time_zone() {
  get_random_item(address.time_zones)
}
