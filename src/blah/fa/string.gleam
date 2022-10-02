import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder.{StringBuilder}
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
      assert Ok(first) =
        starting_vowels
        |> get_random_item
      assert Ok(second) =
        consonants
        |> get_random_item
      pronounceable_internal(
        string_builder.from_strings([first, second]),
        length - 2,
      )
    }
    1 -> pronounceable_internal(string_builder.new(), length)
  }
}

fn pronounceable_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True ->
      state
      |> string_builder.to_string()

    False -> {
      let nonce = int.random(4, 2048)
      let letters = case nonce % 2 {
        0 -> {
          assert Ok(first) =
            vowels
            |> get_random_item
          assert Ok(second) =
            consonants
            |> get_random_item
          [first, second]
          |> list.map(fn(s) {
            s
            |> string_builder.from_string
          })
        }
        1 -> {
          assert Ok(first) =
            consonants
            |> get_random_item
          assert Ok(second) =
            vowels
            |> get_random_item
          [first, second]
          |> list.map(fn(s) {
            s
            |> string_builder.from_string
          })
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
    True ->
      state
      |> string_builder.to_string()

    False -> {
      assert Ok(letter) = get_random_item(letters)
      alpha_internal(
        state
        |> string_builder.append(letter),
        remaining - 1,
      )
    }
  }
}

fn numeric_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True ->
      state
      |> string_builder.to_string()

    False -> {
      assert Ok(digit) = get_random_item(digits)
      numeric_internal(
        state
        |> string_builder.append(digit),
        remaining - 1,
      )
    }
  }
}

fn alphanumeric_internal(state: StringBuilder, remaining: Int) -> String {
  case remaining == 0 {
    True ->
      state
      |> string_builder.to_string()

    False -> {
      assert Ok(character) = get_random_item(characters)
      alphanumeric_internal(
        state
        |> string_builder.append(character),
        remaining - 1,
      )
    }
  }
}

fn with_pattern_internal(state: StringBuilder, given_pattern: String) -> String {
  case
    given_pattern
    |> string.first()
  {
    Ok("%") -> {
      assert Ok(to_append) = case
        given_pattern
        |> string.slice(0, 2)
      {
        "%d" -> get_random_item(digits)
        "%w" -> get_random_item(letters)
        "%c" -> get_random_item(characters)
        "%n" -> get_random_item(non_zero_digits)
        characters -> Ok(characters)
      }
      with_pattern_internal(
        state
        |> string_builder.append(to_append),
        given_pattern
        |> string.drop_left(2),
      )
    }

    Ok(to_append) ->
      with_pattern_internal(
        state
        |> string_builder.append(to_append),
        given_pattern
        |> string.drop_left(1),
      )

    Error(Nil) ->
      state
      |> string_builder.to_string()
  }
}
