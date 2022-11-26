//// same as `blah/name`

import gleam/string
import blah/locales/en/name
import blah/utils.{get_random_item}

pub fn first_name() {
  get_random_item(name.first_names)
}

pub fn female_first_name() {
  get_random_item(name.female_first_names)
}

pub fn male_first_name() {
  get_random_item(name.male_first_names)
}

pub fn last_name() {
  get_random_item(name.last_names)
}

pub fn full_name() {
  [first_name(), last_name()]
  |> string.join(" ")
}

pub fn female_full_name() {
  [female_first_name(), last_name()]
  |> string.join(" ")
}

pub fn male_full_name() {
  [male_first_name(), last_name()]
  |> string.join(" ")
}
