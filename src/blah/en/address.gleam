//// same as `blah/address`

import gleam/int
import blah/en/string
import blah/name
import blah/locales/en/address
import blah/utils.{get_random_item, join}

pub fn country() {
  assert Ok(country) =
    address.countries
    |> get_random_item
  country
}

pub fn country_code() {
  assert Ok(country_code) =
    address.country_codes
    |> get_random_item
  country_code
}

pub fn country_code_alpha3() {
  assert Ok(country_code) =
    address.alpha3_country_codes
    |> get_random_item
  country_code
}

pub fn state() {
  assert Ok(state) =
    address.states
    |> get_random_item
  state
}

pub fn state_code() {
  assert Ok(state_code) =
    address.state_codes
    |> get_random_item
  state_code
}

pub fn city() {
  assert Ok(city) =
    address.cities
    |> get_random_item
  city
}

pub fn street() {
  assert Ok(street) =
    address.streets
    |> get_random_item
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
  assert Ok(direction) =
    address.directions
    |> get_random_item
  direction
}

pub fn direction_code() {
  assert Ok(direction_code) =
    address.direction_codes
    |> get_random_item
  direction_code
}

pub fn full_address() {
  [string.with_pattern("%n%d%d%d"), street()]
  |> join(" ")
}

pub fn time_zone() {
  assert Ok(zone) =
    address.time_zones
    |> get_random_item
  zone
}
