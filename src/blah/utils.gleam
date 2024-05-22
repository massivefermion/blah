import gleam/int
import gleam/list

pub fn get_random_int(min, max) {
  int.random(max - min) + min
}

pub fn get_random_item(given_list: List(a)) {
  let max_index = list.length(given_list)
  let index = int.random(max_index)
  let assert [item, ..] = list.drop(given_list, index)
  item
}
