//// same as `blah/en/string`

import blah/en/string

pub fn alpha(length: Int) {
  string.alpha(length)
}

pub fn lower_alpha(length: Int) {
  string.lower_alpha(length)
}

pub fn upper_alpha(length: Int) {
  string.upper_alpha(length)
}

pub fn numeric(length: Int) {
  string.numeric(length)
}

pub fn alphanumeric(length: Int) {
  string.alphanumeric(length)
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
  string.with_pattern(given_pattern)
}
