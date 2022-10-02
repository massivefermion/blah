import gleam/int
import gleam/list
import gleam/string
import blah/en/word
import blah/name
import blah/en/string as blah_string
import blah/utils.{get_random_item, join}

const email_domains = [
  "gmail.com", "yahoo.com", "hotmail.com", "protonmail.com", "proton.me",
  "aol.com", "ymail.com", "msn.com", "outlook.com", "mail.ru", "live.com",
]

const domain_suffixes = [
  "com", "org", "net", "int", "edu", "gov", "mil", "io", "co",
]

const protocols = ["http", "https"]

pub fn username() {
  let nonce = int.random(4, 2048)

  case nonce % 4 {
    0 ->
      [word.adjective(), name.last_name()]
      |> join("")

    1 ->
      [
        word.adjective(),
        name.last_name()
        |> string.lowercase(),
      ]
      |> join(".")

    2 ->
      [
        word.adjective(),
        name.last_name()
        |> string.lowercase(),
      ]
      |> join("-")

    3 ->
      [
        word.adjective(),
        name.last_name()
        |> string.lowercase(),
      ]
      |> join("_")
  }
}

pub fn email() {
  assert Ok(email_domain) =
    email_domains
    |> get_random_item

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
  let nonce = int.random(4, 2048)

  let hostname = case nonce % 3 {
    0 ->
      [word.adjective(), word.noun()]
      |> join(".")

    1 ->
      [word.adjective(), word.noun()]
      |> join("-")

    2 ->
      [word.adjective(), word.noun()]
      |> join("_")
  }

  assert Ok(suffix) =
    domain_suffixes
    |> get_random_item

  [hostname, suffix]
  |> join(".")
}

pub fn url() {
  assert Ok(protocol) =
    protocols
    |> get_random_item

  [protocol, "://", domain_name()]
  |> join("")
}

pub fn ip_v4() {
  list.repeat("", 4)
  |> list.map(fn(_) { int.random(0, 256) })
  |> list.map(fn(field) {
    field
    |> int.to_string
  })
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

pub fn hex_color() {
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
