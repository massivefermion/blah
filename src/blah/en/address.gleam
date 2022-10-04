//// same as `blah/address`

import gleam/int
import blah/en/string
import blah/name
import blah/locales/en/address
import blah/utils.{get_random_item, join}

pub fn country() {
  assert Ok(country) = get_random_item(address.countries)
  country
}

pub fn country_code() {
  assert Ok(country_code) = get_random_item(address.country_codes)
  country_code
}

pub fn alpha3_country_code() {
  assert Ok(country_code) = get_random_item(address.alpha3_country_codes)
  country_code
}

pub fn state() {
  assert Ok(state) = get_random_item(address.states)
  state
}

pub fn state_code() {
  assert Ok(state_code) = get_random_item(address.state_codes)
  state_code
}

pub fn city() {
  assert Ok(city) = get_random_item(address.cities)
  city
}

pub fn street() {
  assert Ok(street) = get_random_item(address.streets)
  [name.last_name(), street]
  |> join(" ")
}

pub fn zip_code() {
  let nonce = int.random(4, 2048)

  case nonce % 2 {
    0 -> string.with_pattern("%d%d%d%d%d-%d%d%d%d")
    1 -> string.numeric(5)
  }
}

pub fn direction() {
  assert Ok(direction) = get_random_item(address.directions)
  direction
}

pub fn direction_code() {
  assert Ok(direction_code) = get_random_item(address.direction_codes)
  direction_code
}

pub fn full_address() {
  [string.with_pattern("%n%d%d%d"), street()]
  |> join(" ")
}

pub fn time_zone() {
  assert Ok(zone) = get_random_item(address.time_zones)
  zone
}
