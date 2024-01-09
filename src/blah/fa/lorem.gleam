import gleam/list
import gleam/string
import blah/fa/string as blah_string
import blah/utils.{get_random_int}

pub fn word() {
  blah_string.pronounceable()
}

pub fn words(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { word() })
  |> string.join(" ")
}

pub fn sentence() {
  let length = get_random_int(4, 16)
  [words(length), "."]
  |> string.join("")
}

pub fn sentences(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { sentence() })
  |> string.join(" ")
}

pub fn paragraph() {
  let length = get_random_int(4, 8)
  list.repeat("", length)
  |> list.map(fn(_) { sentence() })
  |> string.join(" ")
}

pub fn paragraphs(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { paragraph() })
  |> string.join("\n")
}
