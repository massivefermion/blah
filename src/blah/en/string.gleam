//// same as `blah/string`

import gleam/list
import gleam/string
import gleam/string_builder.{type StringBuilder}

import blah/utils.{get_random_int, get_random_item}

pub fn alpha(length: Int) {
  alpha_internal(length, string_builder.new())
}

pub fn lower_alpha(length: Int) {
  lower_internal(length, string_builder.new())
}

pub fn upper_alpha(length: Int) {
  upper_internal(length, string_builder.new())
}

pub fn numeric(length: Int) {
  numeric_internal(length, string_builder.new())
}

pub fn alphanumeric(length: Int) {
  alphanumeric_internal(length, string_builder.new())
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
  with_pattern_internal(given_pattern, string_builder.new())
}

pub fn roman_numeral(min: Int, max: Int) {
  get_random_int(min, max)
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

fn alpha_internal(remaining: Int, storage: StringBuilder) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(storage)

    False -> {
      let letter = get_random_item(letters)
      alpha_internal(remaining - 1, string_builder.append(storage, letter))
    }
  }
}

fn lower_internal(remaining: Int, storage: StringBuilder) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(storage)

    False -> {
      let letter = get_random_item(lower_letters)
      lower_internal(remaining - 1, string_builder.append(storage, letter))
    }
  }
}

fn upper_internal(remaining: Int, storage: StringBuilder) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(storage)

    False -> {
      let letter = get_random_item(upper_letters)
      upper_internal(remaining - 1, string_builder.append(storage, letter))
    }
  }
}

fn numeric_internal(remaining: Int, storage: StringBuilder) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(storage)

    False -> {
      let digit = get_random_item(digits)
      numeric_internal(remaining - 1, string_builder.append(storage, digit))
    }
  }
}

fn alphanumeric_internal(remaining: Int, storage: StringBuilder) -> String {
  case remaining == 0 {
    True -> string_builder.to_string(storage)

    False -> {
      let character = get_random_item(characters)
      alphanumeric_internal(
        remaining - 1,
        string_builder.append(storage, character),
      )
    }
  }
}

fn with_pattern_internal(
  given_pattern: String,
  storage: StringBuilder,
) -> String {
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
        string.drop_left(given_pattern, 2),
        string_builder.append(storage, to_append),
      )
    }

    Ok(to_append) ->
      with_pattern_internal(
        string.drop_left(given_pattern, 1),
        string_builder.append(storage, to_append),
      )

    Error(Nil) -> string_builder.to_string(storage)
  }
}
