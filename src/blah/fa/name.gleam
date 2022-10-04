import blah/locales/fa/name
import blah/utils.{get_random_item, join}

pub fn first_name() {
  assert Ok(first_name) = get_random_item(name.first_names)
  first_name
}

pub fn female_first_name() {
  assert Ok(first_name) = get_random_item(name.female_first_names)
  first_name
}

pub fn male_first_name() {
  assert Ok(first_name) = get_random_item(name.male_first_names)
  first_name
}

pub fn last_name() {
  assert Ok(last_name) = get_random_item(name.last_names)
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
