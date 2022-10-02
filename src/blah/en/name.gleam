//// same as `blah/name`

import blah/locales/en/name
import blah/utils.{get_random_item, join}

pub fn first_name() {
  assert Ok(first_name) =
    name.first_names
    |> get_random_item
  first_name
}

pub fn female_first_name() {
  assert Ok(first_name) =
    name.female_first_names
    |> get_random_item
  first_name
}

pub fn male_first_name() {
  assert Ok(first_name) =
    name.male_first_names
    |> get_random_item
  first_name
}

pub fn last_name() {
  assert Ok(last_name) =
    name.last_names
    |> get_random_item
  last_name
}

pub fn full_name() {
  [first_name(), last_name()]
  |> join(" ")
}

pub fn female_full_name() {
  [female_first_name(), last_name()]
  |> join(" ")
}

pub fn male_full_name() {
  [male_first_name(), last_name()]
  |> join(" ")
}
