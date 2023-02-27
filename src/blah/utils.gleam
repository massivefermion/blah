import gleam/int
import gleam/list

pub fn get_random_item(given_list: List(a)) {
  let max_index = list.length(given_list)
  let index = int.random(0, max_index)
  let assert Ok(item) = list.at(given_list, index)
  item
}
