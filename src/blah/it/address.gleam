import gleam/string

import blah/locales/it/address
import blah/utils.{get_random_item}

pub fn country() {
  get_random_item(address.countries)
}

pub fn region() {
  get_random_item(address.regions)
}

pub fn city() {
  get_random_item(address.cities)
}

pub fn province() {
  get_random_item(address.provinces)
}

pub fn street() {
  let street = get_random_item(address.streets)
  // most of Italian street names starts with "via"        
  ["Via", street]
  |> string.join(" ")
}

pub fn direction() {
  get_random_item(address.directions)
}

pub fn direction_codes() {
  get_random_item(address.direction_codes)
}

pub fn time_zones() {
  get_random_item(address.time_zones)
}
