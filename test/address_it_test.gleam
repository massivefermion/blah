import gleam/io
import gleam/list
import gleam/string
import gleeunit/should

import blah/it/address
import blah/locales/it/address as address_repo

pub fn country_test() {
  list.contains(address_repo.countries, address.country())
  |> should.be_true
}

pub fn region_test() {
  list.contains(address_repo.regions, address.region())
  |> should.be_true
}

pub fn city_test() {
  list.contains(address_repo.cities, address.city())
  |> should.be_true
}

pub fn province_test() {
  list.contains(address_repo.provinces, address.province())
  |> should.be_true
}

pub fn street_test() {
  list.contains(
    address_repo.streets,
    address.street() |> string.replace("Via ", ""),
  )
  |> should.be_true
}

pub fn direction_test() {
  list.contains(address_repo.directions, address.direction())
}

pub fn direction_codes_test() {
  list.contains(address_repo.direction_codes, address.direction_codes())
}

pub fn time_zones_test() {
  list.contains(address_repo.time_zones, address.time_zones())
}
