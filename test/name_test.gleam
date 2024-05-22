import gleam/list
import gleam/string
import gleeunit/should

import blah/locales/en/name as name_repo
import blah/name

pub fn first_name_test() {
  list.contains(name_repo.first_names, name.first_name())
  |> should.be_true
}

pub fn last_name_test() {
  list.contains(name_repo.last_names, name.last_name())
  |> should.be_true
}

pub fn female_first_name_test() {
  list.contains(name_repo.female_first_names, name.female_first_name())
  |> should.be_true
}

pub fn female_full_name_test() {
  let full_name = name.female_full_name()
  let assert Ok(#(first_name, _)) = string.split_once(full_name, on: " ")

  list.contains(name_repo.female_first_names, first_name)
  |> should.be_true
}

pub fn male_first_name_test() {
  list.contains(name_repo.male_first_names, name.male_first_name())
  |> should.be_true
}

pub fn male_full_name_test() {
  let full_name = name.male_full_name()
  let assert Ok(#(first_name, _)) = string.split_once(full_name, on: " ")

  list.contains(name_repo.male_first_names, first_name)
  |> should.be_true
}
