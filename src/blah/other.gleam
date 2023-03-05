//// same as `blah/en/finance`

import gleam/float
import blah/en/other

pub fn currency() {
  other.currency()
}

pub fn latitude() {
  float.random(-90.0, 90.0)
}

pub fn longitude() {
  float.random(-180.0, 180.0)
}
