//// same as `blah/address`

import gleam/int
import gleam/string
import blah/name
import blah/locales/en/address
import blah/utils.{get_random_item}
import blah/en/string as blah_string

pub fn country() {
  get_random_item(address.countries)
}

pub fn country_code() {
  get_random_item(address.country_codes)
}

pub fn alpha3_country_code() {
  get_random_item(address.alpha3_country_codes)
}

pub fn state() {
  get_random_item(address.states)
}

pub fn state_code() {
  get_random_item(address.state_codes)
}

pub fn city() {
  get_random_item(address.cities)
}

pub fn street() {
  let street = get_random_item(address.streets)
  [name.last_name(), street]
  |> string.join(" ")
}

pub fn zip_code() {
  let nonce = int.random(4, 2048)

  case nonce % 2 {
    0 -> blah_string.with_pattern("%d%d%d%d%d-%d%d%d%d")
    1 -> blah_string.numeric(5)
  }
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
