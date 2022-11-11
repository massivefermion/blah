//// same as `blah/string`

import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder.{StringBuilder}
import blah/utils.{get_random_item}

const lower_letters = [
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
  "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
]

const upper_letters = [
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
  "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
]

const letters = [
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
  "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
  "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
  "w", "x", "y", "z",
]

const digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

const non_zero_digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

const characters = [
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
  "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
  "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
  "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
]

pub fn alpha(length: Int) {
  alpha_internal(string_builder.new(), length)
}

pub fn lower_alpha(length: Int) {
  lower_internal(string_builder.new(), length)
}

pub fn upper_alpha(length: Int) {
  upper_internal(string_builder.new(), length)
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
///
///     %l - lowercase letters
///
///     %u - uppercase letters
///
pub fn with_pattern(given_pattern: String) {
  with_pattern_internal(string_builder.new(), given_pattern)
}

pub fn roman_numeral(min: Int, max: Int) {
  int.random(min, max)
  |> list.repeat("I", _)
  |> string_builder.from_strings
  |> string_builder.replace("IIIII", "V")
  |> string_builder.replace("VV", "X")
  |> string_builder.replace("XXXXX", "L")
  |> string_builder.replace("LL", "C")
  |> string_builder.replace("CCCCC", "D")
  |> string_builder.replace("DD", "M")
  |> string_builder.replace("DCCCC", "CM")
  |> string_builder.replace("CCCC", "CD")
  |> string_builder.replace("LXXXX", "XC")
  |> string_builder.replace("XXXX", "XL")
  |> string_builder.replace("VIIII", "IX")
  |> string_builder.replace("IIII", "IV")
  |> string_builder.to_string
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

fn lower_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(state)

    False -> {
      let letter = get_random_item(lower_letters)
      lower_internal(string_builder.append(state, letter), remaining - 1)
    }
  }
}

fn upper_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(state)

    False -> {
      let letter = get_random_item(upper_letters)
      upper_internal(string_builder.append(state, letter), remaining - 1)
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
        "%l" -> get_random_item(lower_letters)
        "%u" -> get_random_item(upper_letters)
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
