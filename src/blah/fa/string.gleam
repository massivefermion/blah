import gleam/list
import gleam/string
import gleam/string_tree.{type StringTree}

import blah/utils.{get_random_int, get_random_item}

pub fn alpha(length: Int) {
  alpha_internal(length, string_tree.new())
}

pub fn numeric(length: Int) {
  numeric_internal(length, string_tree.new())
}

pub fn alphanumeric(length: Int) {
  alphanumeric_internal(length, string_tree.new())
}

/// you can use the below codes to specify your desired pattern:
///
///     %c - digits and letters
///
///     %w - letters
///
///     %d - digits
///
///     %n - non-zero digits
pub fn with_pattern(given_pattern: String) {
  with_pattern_internal(given_pattern, string_tree.new())
}

pub fn pronounceable() {
  let nonce = get_random_int(4, 2048)
  let length = { get_random_int(2, 4) } * 2

  case nonce % 2 {
    0 -> {
      let first = get_random_item(starting_vowels)
      let second = get_random_item(consonants)
      pronounceable_internal(
        length - 2,
        string_tree.from_strings([first, second]),
      )
    }
    _ -> pronounceable_internal(length, string_tree.new())
  }
}

const vowels = ["ا", "و"]

const starting_vowels = ["آ", "او"]

const consonants = [
  "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر", "ز", "ژ", "س", "ش", "ص",
  "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل", "م", "ن", "ه", "ی",
]

const letters = [
  "آ", "ا", "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر", "ز", "ژ", "س",
  "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل", "م", "ن", "و", "ه",
  "ی",
]

const digits = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]

const non_zero_digits = ["۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]

const characters = [
  "آ", "ا", "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر", "ز", "ژ", "س",
  "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل", "م", "ن", "و", "ه",
  "ی", "۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹",
]

fn pronounceable_internal(remaining: Int, storage: StringTree) -> String {
  case remaining {
    0 -> string_tree.to_string(storage)

    _ -> {
      let nonce = get_random_int(4, 2048)
      let letters = case nonce % 2 {
        0 -> {
          let first = get_random_item(vowels)
          let second = get_random_item(consonants)
          [first, second]
          |> list.map(string_tree.from_string)
        }
        _ -> {
          let first = get_random_item(consonants)
          let second = get_random_item(vowels)
          [first, second]
          |> list.map(string_tree.from_string)
        }
      }
      pronounceable_internal(
        remaining - 2,
        string_tree.concat([storage, ..letters]),
      )
    }
  }
}

fn alpha_internal(remaining: Int, storage: StringTree) -> String {
  case remaining == 0 {
    True -> string_tree.to_string(storage)

    False -> {
      let letter = get_random_item(letters)
      alpha_internal(remaining - 1, string_tree.append(storage, letter))
    }
  }
}

fn numeric_internal(remaining: Int, storage: StringTree) -> String {
  case remaining == 0 {
    True -> string_tree.to_string(storage)

    False -> {
      let digit = get_random_item(digits)
      numeric_internal(remaining - 1, string_tree.append(storage, digit))
    }
  }
}

fn alphanumeric_internal(remaining: Int, storage: StringTree) -> String {
  case remaining == 0 {
    True -> string_tree.to_string(storage)

    False -> {
      let character = get_random_item(characters)
      alphanumeric_internal(
        remaining - 1,
        string_tree.append(storage, character),
      )
    }
  }
}

fn with_pattern_internal(given_pattern: String, storage: StringTree) -> String {
  case string.first(given_pattern) {
    Ok("%") -> {
      let to_append = case string.slice(given_pattern, 0, 2) {
        "%d" -> get_random_item(digits)
        "%w" -> get_random_item(letters)
        "%c" -> get_random_item(characters)
        "%n" -> get_random_item(non_zero_digits)
        characters -> characters
      }
      with_pattern_internal(
        string.drop_start(given_pattern, 2),
        string_tree.append(storage, to_append),
      )
    }

    Ok(to_append) ->
      with_pattern_internal(
        string.drop_start(given_pattern, 1),
        string_tree.append(storage, to_append),
      )

    Error(Nil) -> string_tree.to_string(storage)
  }
}
