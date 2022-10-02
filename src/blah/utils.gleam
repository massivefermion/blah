import gleam/int
import gleam/list
import gleam/string_builder

pub fn get_random_item(given_list: List(a)) {
  let max_index =
    given_list
    |> list.length

  let index = int.random(0, max_index)

  given_list
  |> list.at(index)
}

pub fn join(parts: List(String), separator: String) {
  case
    parts
    |> list.rest()
  {
    Ok(rest) -> {
      assert Ok(first) =
        parts
        |> list.first()
      let builder =
        rest
        |> list.fold(
          first
          |> string_builder.from_string(),
          fn(state, current) {
            state
            |> string_builder.append(separator)
            |> string_builder.append(current)
          },
        )
      builder
      |> string_builder.to_string()
    }
    Error(Nil) -> ""
  }
}
