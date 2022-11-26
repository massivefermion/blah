import gleam/list
import gleeunit/should
import blah/utils

const items = ["A", "B", "C"]

pub fn get_random_item_test() {
  items
  |> utils.get_random_item
  |> list.contains(items, _)
  |> should.be_true
}
