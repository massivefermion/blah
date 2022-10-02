import gleam/int
import gleam/list
import blah/fa/string
import blah/utils.{join}

pub fn word() {
  string.pronounceable()
}

pub fn words(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { word() })
  |> join(" ")
}

pub fn slug(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { word() })
  |> join("-")
}

pub fn sentence() {
  let length = int.random(4, 16)
  [words(length), "."]
  |> join("")
}

pub fn sentences(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { sentence() })
  |> join(" ")
}

pub fn paragraph() {
  let length = int.random(4, 8)
  list.repeat("", length)
  |> list.map(fn(_) { sentence() })
  |> join(" ")
}

pub fn paragraphs(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { paragraph() })
  |> join("\n")
}
