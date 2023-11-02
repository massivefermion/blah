import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder.{type StringBuilder}
import blah/utils.{get_random_item}

const vowels = ["ا", "و"]

const starting_vowels = ["آ", "او"]

const consonants = [
  "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر", "ز", "ژ",
  "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل",
  "م", "ن", "ه", "ی",
]

const letters = [
  "آ", "ا", "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر",
  "ز", "ژ", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک",
  "گ", "ل", "م", "ن", "و", "ه", "ی",
]

const digits = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]

const non_zero_digits = ["۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]

const characters = [
  "آ", "ا", "ب", "پ", "ت", "ث", "ج", "چ", "ح", "خ", "د", "ذ", "ر",
  "ز", "ژ", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک",
  "گ", "ل", "م", "ن", "و", "ه", "ی", "۰", "۱", "۲", "۳", "۴", "۵",
  "۶", "۷", "۸", "۹",
]

pub fn alpha(length: Int) {
  alpha_internal(string_builder.new(), length)
}

pub fn numeric(length: Int) {
  numeric_internal(string_builder.new(), length)
}

pub fn alphanumeric(length: Int) {
  alphanumeric_internal(string_builder.new(), length)
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
  with_pattern_internal(string_builder.new(), given_pattern)
}

pub fn pronounceable() {
  let nonce = int.random(4, 2048)
  let length = int.random(2, 4) * 2

  case nonce % 2 {
    0 -> {
      let first = get_random_item(starting_vowels)
      let second = get_random_item(consonants)
      pronounceable_internal(
        string_builder.from_strings([first, second]),
        length - 2,
      )
    }
    1 -> pronounceable_internal(string_builder.new(), length)
  }
}

fn pronounceable_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining {
    0 -> string_builder.to_string(state)

    _ -> {
      let nonce = int.random(4, 2048)
      let letters = case nonce % 2 {
        0 -> {
          let first = get_random_item(vowels)
          let second = get_random_item(consonants)
          [first, second]
          |> list.map(string_builder.from_string)
        }
        1 -> {
          let first = get_random_item(consonants)
          let second = get_random_item(vowels)
          [first, second]
          |> list.map(string_builder.from_string)
        }
      }
      pronounceable_internal(
        string_builder.concat([state, ..letters]),
        remaining - 2,
      )
    }
  }
}

fn alpha_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(state)

    False -> {
      let letter = get_random_item(letters)
      alpha_internal(string_builder.append(state, letter), remaining - 1)
    }
  }
}

fn numeric_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(state)

    False -> {
      let digit = get_random_item(digits)
      numeric_internal(string_builder.append(state, digit), remaining - 1)
    }
  }
}

fn alphanumeric_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(state)

    False -> {
      let character = get_random_item(characters)
      alphanumeric_internal(
        string_builder.append(state, character),
        remaining - 1,
      )
    }
  }
}

fn with_pattern_internal(state: StringBuilder, given_pattern: String) -> String {
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
        string_builder.append(state, to_append),
        string.drop_left(given_pattern, 2),
      )
    }

    Ok(to_append) ->
      with_pattern_internal(
        string_builder.append(state, to_append),
        string.drop_left(given_pattern, 1),
      )

    Error(Nil) -> string_builder.to_string(state)
  }
}
