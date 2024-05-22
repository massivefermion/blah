//// same as `blah/lorem`

import gleam/list
import gleam/string

import blah/locales/fr/lorem
import blah/utils.{get_random_int, get_random_item}

pub fn word() {
  get_random_item(lorem.words)
}

pub fn words(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { word() })
  |> string.join(" ")
}

pub fn slug(num: Int) {
  list.repeat("", num)
  |> list.map(fn(_) { word() })
  |> string.join("-")
}

pub fn sentence() {
  let length = get_random_int(4, 16)
  [string.capitalise(words(length)), "."]
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
