import gleam/int
import gleam/list
import gleam/string
import blah/en/word
import blah/name
import blah/en/string as blah_string
import blah/utils.{get_random_item, join}

const email_domains = [
  "aol.com", "gmail.com", "hotmail.com", "live.com", "mail.ru", "msn.com",
  "outlook.com", "proton.me", "protonmail.com", "yahoo.com", "ymail.com",
]

const domain_suffixes = [
  "co", "com", "edu", "gov", "int", "io", "mil", "net", "org",
]

const protocols = ["http", "https"]

pub fn username() {
  let adjective = word.adjective()
  let last_name = name.last_name()

  let nonce = int.random(4, 2048)
  case nonce % 4 {
    0 ->
      [adjective, last_name]
      |> join("")

    1 ->
      [
        adjective,
        last_name
        |> string.lowercase(),
      ]
      |> join(".")

    2 ->
      [
        adjective,
        last_name
        |> string.lowercase(),
      ]
      |> join("-")

    3 ->
      [
        adjective,
        last_name
        |> string.lowercase(),
      ]
      |> join("_")
  }
}

pub fn email() {
  assert Ok(email_domain) = get_random_item(email_domains)

  [username(), email_domain]
  |> join("@")
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
  |> join(" ")
}

pub fn domain_name() {
  let adjective = word.adjective()
  let noun = word.noun()

  let nonce = int.random(4, 2048)
  let hostname = case nonce % 3 {
    0 ->
      [adjective, noun]
      |> join(".")

    1 ->
      [adjective, noun]
      |> join("-")

    2 ->
      [adjective, noun]
      |> join("_")
  }

  assert Ok(suffix) = get_random_item(domain_suffixes)

  [hostname, suffix]
  |> join(".")
}

pub fn url() {
  assert Ok(protocol) = get_random_item(protocols)

  [protocol, "://", domain_name()]
  |> join("")
}

pub fn ip_v4() {
  list.repeat("", 4)
  |> list.map(fn(_) { int.random(0, 256) })
  |> list.map(int.to_string)
  |> join(".")
}

pub fn ip_v6() {
  list.repeat("", 8)
  |> list.map(fn(_) { int.random(0, 65536) })
  |> list.map(fn(field) {
    field
    |> int.to_base16
    |> string.lowercase
  })
  |> join(":")
}

pub fn mac() {
  list.repeat("", 6)
  |> list.map(fn(_) { int.random(0, 256) })
  |> list.map(fn(field) {
    field
    |> int.to_base16
    |> string.lowercase
  })
  |> join(":")
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
  |> join("")
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
  |> join("")
}

pub fn hex_color() {
  let nonce = int.random(4, 2048)

  case nonce % 2 {
    0 -> long_hex_color()
    1 -> short_hex_color()
  }
}
