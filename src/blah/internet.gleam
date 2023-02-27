import gleam/int
import gleam/pair
import gleam/list
import gleam/string
import blah/name
import blah/en/word
import blah/utils.{get_random_item}
import blah/en/string as blah_string

const email_domains = [
  "aol.com", "gmail.com", "hotmail.com", "live.com", "mail.ru", "msn.com",
  "outlook.com", "proton.me", "protonmail.com", "yahoo.com", "ymail.com",
]

const domain_suffixes = [
  "co", "com", "edu", "gov", "int", "io", "mil", "net", "org",
]

const protocols = ["http", "https"]

const language_codes = [
  "aa", "ab", "ae", "af", "ak", "am", "an", "ar", "as", "av", "ay", "az", "ba",
  "be", "bg", "bh", "bi", "bm", "bn", "bo", "br", "bs", "ca", "ce", "ch", "co",
  "cr", "cs", "cu", "cv", "cy", "da", "de", "dv", "dz", "ee", "el", "en", "eo",
  "es", "et", "eu", "fa", "ff", "fi", "fj", "fo", "fr", "fy", "ga", "gd", "gl",
  "gn", "gu", "gv", "ha", "he", "hi", "ho", "hr", "ht", "hu", "hy", "hz", "ia",
  "id", "ie", "ig", "ii", "ik", "io", "is", "it", "iu", "ja", "jv", "ka", "kg",
  "ki", "kj", "kk", "kl", "km", "kn", "ko", "kr", "ks", "ku", "kv", "kw", "ky",
  "la", "lb", "lg", "li", "ln", "lo", "lt", "lu", "lv", "mg", "mh", "mi", "mk",
  "ml", "mn", "mr", "ms", "mt", "my", "na", "nb", "nd", "ne", "ng", "nl", "nn",
  "no", "nr", "nv", "ny", "oc", "oj", "om", "or", "os", "pa", "pi", "pl", "ps",
  "pt", "qu", "rm", "rn", "ro", "ru", "rw", "sa", "sc", "sd", "se", "sg", "si",
  "sk", "sl", "sm", "sn", "so", "sq", "sr", "ss", "st", "su", "sv", "sw", "ta",
  "te", "tg", "th", "ti", "tk", "tl", "tn", "to", "tr", "ts", "tt", "tw", "ty",
  "ug", "uk", "ur", "uz", "ve", "vi", "vo", "wa", "wo", "xh", "yi", "yo", "za",
  "zh", "zu",
]

const status_codes = [
  #("informational", [100, 101, 102, 103]),
  #("successful", [200, 201, 202, 203, 204, 205, 206, 207, 208, 226]),
  #("redirection", [300, 301, 302, 303, 304, 305, 306, 307, 308]),
  #(
    "client_error",
    [
      400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414,
      415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 428, 429, 431, 451,
    ],
  ),
  #("server_error", [500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511]),
]

pub type HTTPStatusClass {
  Informational
  Successful
  Redirection
  ClientError
  ServerError
}

pub fn username() {
  let adjective = word.adjective()
  let last_name = name.last_name()

  let nonce = int.random(4, 2048)
  case nonce % 4 {
    0 ->
      [adjective, last_name]
      |> string.join("")

    1 ->
      [adjective, string.lowercase(last_name)]
      |> string.join(".")

    2 ->
      [adjective, string.lowercase(last_name)]
      |> string.join("-")

    3 ->
      [adjective, string.lowercase(last_name)]
      |> string.join("_")
  }
}

pub fn email() {
  let email_domain = get_random_item(email_domains)

  [username(), email_domain]
  |> string.join("@")
}

pub fn password() {
  let length = int.random(8, 32)
  blah_string.alphanumeric(length)
}

pub fn passphrase() {
  [
    word.adjective(),
    name.first_name()
    |> string.lowercase(),
    word.verb(),
    word.adverb(),
  ]
  |> string.join(" ")
}

pub fn domain_name() {
  let adjective = word.adjective()
  let noun = word.noun()

  let nonce = int.random(4, 2048)
  let hostname = case nonce % 3 {
    0 ->
      [adjective, noun]
      |> string.join(".")

    1 ->
      [adjective, noun]
      |> string.join("-")

    2 ->
      [adjective, noun]
      |> string.join("_")
  }

  let suffix = get_random_item(domain_suffixes)

  [hostname, suffix]
  |> string.join(".")
}

pub fn url() {
  let protocol = get_random_item(protocols)

  [protocol, "://", domain_name()]
  |> string.join("")
}

pub fn ip_v4() {
  list.repeat("", 4)
  |> list.map(fn(_) { int.random(0, 256) })
  |> list.map(int.to_string)
  |> string.join(".")
}

pub fn ip_v6() {
  list.repeat("", 8)
  |> list.map(fn(_) { int.random(0, 65_536) })
  |> list.map(fn(field) {
    field
    |> int.to_base16
    |> string.lowercase
  })
  |> string.join(":")
}

pub fn mac() {
  list.repeat("", 6)
  |> list.map(fn(_) { int.random(0, 256) })
  |> list.map(fn(field) {
    field
    |> int.to_base16
    |> string.lowercase
  })
  |> string.join(":")
}

pub fn long_hex_color() {
  [
    "#",
    ..list.repeat("", 3)
    |> list.map(fn(_) { int.random(0, 256) })
    |> list.map(fn(field) {
      field
      |> int.to_base16
      |> string.lowercase
      |> string.pad_left(2, "0")
    })
  ]
  |> string.join("")
}

pub fn short_hex_color() {
  [
    "#",
    ..list.repeat("", 3)
    |> list.map(fn(_) { int.random(0, 15) })
    |> list.map(fn(field) {
      field
      |> int.to_base16
      |> string.lowercase
    })
  ]
  |> string.join("")
}

pub fn hex_color() {
  let nonce = int.random(4, 2048)

  case nonce % 2 {
    0 -> long_hex_color()
    1 -> short_hex_color()
  }
}

pub fn mongo_object_id() {
  list.repeat("", 24)
  |> list.map(fn(_) { int.random(0, 15) })
  |> list.map(fn(digit) {
    digit
    |> int.to_base16
    |> string.lowercase
  })
  |> string.join("")
}

pub fn semver() {
  list.repeat("", int.random(2, 4))
  |> list.map(fn(_) { int.random(0, 32) })
  |> list.map(int.to_string)
  |> string.join(".")
}

pub fn language_code() {
  get_random_item(language_codes)
}

pub fn status_code() {
  let #(_, codes) = get_random_item(status_codes)
  get_random_item(codes)
}

pub fn status_code_in_class(class: HTTPStatusClass) {
  let class_string = case class {
    Informational -> "informational"
    Successful -> "successful"
    Redirection -> "redirection"
    ClientError -> "client_error"
    ServerError -> "server_error"
  }

  let [#(_, codes)] =
    list.filter(status_codes, fn(kv) { pair.first(kv) == class_string })

  get_random_item(codes)
}
