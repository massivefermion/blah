import gleeunit/should
import gleam/list
import blah/utils

const items = ["A", "B", "C"]

pub fn get_random_item_test() {
  assert Ok(item) = utils.get_random_item(items)
  list.contains(items, item)
  |> should.be_true
}

pub fn join_without_separator_test() {
  items
  |> utils.join("")
  |> should.equal("ABC")
}

pub fn join_with_separator_test() {
  items
  |> utils.join("-")
  |> should.equal("A-B-C")
}
