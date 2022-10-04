import gleam/int
import gleam/list
import gleam/string_builder

pub fn get_random_item(given_list: List(a)) {
  let max_index = list.length(given_list)
  let index = int.random(0, max_index)
  list.at(given_list, index)
}

pub fn join(parts: List(String), separator: String) {
  case list.rest(parts) {
    Ok(rest) -> {
      assert Ok(first) = list.first(parts)
      list.fold(
        rest,
        string_builder.from_string(first),
        fn(state, current) {
          state
          |> string_builder.append(separator)
          |> string_builder.append(current)
        },
      )
      |> string_builder.to_string()
    }
    Error(Nil) -> ""
  }
}
