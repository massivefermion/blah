import blah/locales/fa/name
import blah/utils.{get_random_item, join}

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
