import gleam/int
import gleam/list
import gleam/pair
import gleam/string

import blah/en/string as blah_string
import blah/en/word
import blah/name
import blah/utils.{get_random_int, get_random_item}

pub type HTTPStatusClass {
  Informational
  Successful
  Redirection
  ClientError
  ServerError
}

pub fn username(name: String) {
  let adjective = word.adjective()

  let nonce = get_random_int(4, 2048)
  case nonce % 8 {
    0 ->
      [adjective, string.replace(name, " ", "")]
      |> string.join("")

    1 ->
      [adjective, string.replace(string.lowercase(name), " ", ".")]
      |> string.join(".")

    2 ->
      [adjective, string.replace(string.lowercase(name), " ", "-")]
      |> string.join("-")

    3 ->
      [adjective, string.replace(string.lowercase(name), " ", "_")]
      |> string.join("_")

    4 ->
      [
        adjective,
        string.replace(name, " ", ""),
        blah_string.with_pattern("%d%d"),
      ]
      |> string.join("")

    5 ->
      [
        adjective,
        string.replace(string.lowercase(name), " ", "."),
        blah_string.with_pattern("%d%d"),
      ]
      |> string.join(".")

    6 ->
      [
        adjective,
        string.replace(string.lowercase(name), " ", "-"),
        blah_string.with_pattern("%d%d"),
      ]
      |> string.join("-")

    _ ->
      [
        adjective,
        string.replace(string.lowercase(name), " ", "_"),
        blah_string.with_pattern("%d%d"),
      ]
      |> string.join("_")
  }
}

pub fn email(name) {
  let email_domain = get_random_item(email_domains)

  [username(name), email_domain]
  |> string.join("@")
}

pub fn password() {
  let length = get_random_int(8, 32)
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

  let nonce = get_random_int(4, 2048)
  let hostname = case nonce % 3 {
    0 ->
      [adjective, noun]
      |> string.join(".")

    1 ->
      [adjective, noun]
      |> string.join("-")

    _ ->
      [adjective, noun]
      |> string.join("_")
  }

  let suffix = get_random_item(domain_suffixes)

  [hostname, suffix]
  |> string.join(".")
}

pub fn uri() {
  let nonce = get_random_int(4, 2048)
  let protocol = get_random_item(protocols)

  case nonce % 4 {
    0 ->
      [protocol, "://", domain_name()]
      |> string.join("")

    1 ->
      [protocol, "://", domain_name(), "/"]
      |> string.join("")

    2 ->
      [
        protocol,
        "://",
        domain_name(),
        "/",
        list.repeat("", get_random_int(2, 8))
          |> list.map(fn(_) { word.noun() })
          |> string.join("/"),
      ]
      |> string.join("")

    _ ->
      [
        protocol,
        "://",
        domain_name(),
        "/",
        list.repeat("", get_random_int(2, 8))
          |> list.map(fn(_) { word.noun() })
          |> string.join("/"),
        "/",
      ]
      |> string.join("")
  }
}

pub fn ip_v4() {
  list.repeat("", 4)
  |> list.map(fn(_) { int.random(256) })
  |> list.map(int.to_string)
  |> string.join(".")
}

pub fn ip_v6() {
  list.repeat("", 8)
  |> list.map(fn(_) { int.random(65_536) })
  |> list.map(fn(field) {
    field
    |> int.to_base16
    |> string.lowercase
  })
  |> string.join(":")
}

pub fn mac() {
  list.repeat("", 6)
  |> list.map(fn(_) { int.random(256) })
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
    |> list.map(fn(_) { int.random(256) })
    |> list.map(fn(field) {
      field
      |> int.to_base16
      |> string.lowercase
      |> string.pad_start(2, "0")
    })
  ]
  |> string.join("")
}

pub fn short_hex_color() {
  [
    "#",
    ..list.repeat("", 3)
    |> list.map(fn(_) { int.random(16) })
    |> list.map(fn(field) {
      field
      |> int.to_base16
      |> string.lowercase
    })
  ]
  |> string.join("")
}

pub fn hex_color() {
  let nonce = get_random_int(4, 2048)

  case nonce % 2 {
    0 -> long_hex_color()
    _ -> short_hex_color()
  }
}

pub fn status_code() {
  let #(_, codes) = get_random_item(status_codes)
  get_random_item(codes)
}

pub fn status_code_in_class(class: HTTPStatusClass) {
  let assert [#(_, codes)] =
    list.filter(status_codes, fn(kv) { pair.first(kv) == class })

  get_random_item(codes)
}

const email_domains = [
  "aol.com", "gmail.com", "hotmail.com", "live.com", "mail.ru", "msn.com",
  "outlook.com", "proton.me", "protonmail.com", "yahoo.com", "ymail.com",
]

const domain_suffixes = [
  "co", "com", "edu", "gov", "int", "io", "mil", "net", "org",
]

const protocols = ["http", "https"]

const status_codes = [
  #(Informational, [100, 101, 102, 103]),
  #(Successful, [200, 201, 202, 203, 204, 205, 206, 207, 208, 226]),
  #(Redirection, [300, 301, 302, 303, 304, 305, 306, 307, 308]),
  #(
    ClientError,
    [
      400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414,
      415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 428, 429, 431, 451,
    ],
  ), #(ServerError, [500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511]),
]
