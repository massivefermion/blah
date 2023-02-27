import gleam/int
import gleam/list
import gleam/regex
import gleam/string
import gleeunit/should
import blah/internet

pub fn username_test() {
  internet.username()
  |> verify_username
  |> should.be_true
}

pub fn email_test() {
  let email_parts = string.split(internet.email(), "@")

  list.length(email_parts)
  |> should.equal(2)

  let [username, domain] = email_parts

  username
  |> verify_username
  |> should.be_true

  let domain_parts = string.split(domain, ".")

  list.length(domain_parts)
  |> should.equal(2)
}

pub fn passphrase_test() {
  let passphrase_parts = string.split(internet.passphrase(), " ")

  list.length(passphrase_parts)
  |> should.equal(4)
}

pub fn domain_name_test() {
  internet.domain_name()
  |> verify_domain_name
  |> should.be_true
}

pub fn url_test() {
  let url_parts = string.split(internet.url(), "://")

  url_parts
  |> list.length
  |> should.equal(2)

  let [protocol, domain_name] = url_parts

  list.contains(["http", "https"], protocol)
  |> should.be_true

  domain_name
  |> verify_domain_name
  |> should.be_true
}

pub fn ip_v4_test() {
  let fields = string.split(internet.ip_v4(), ".")

  fields
  |> list.length
  |> should.equal(4)

  let assert Ok(fields) =
    fields
    |> list.try_map(int.parse)

  fields
  |> list.each(fn(f) { should.be_true(f >= 0 && f <= 255) })
}

pub fn ip_v6_test() {
  let fields = string.split(internet.ip_v6(), ":")

  fields
  |> list.length
  |> should.equal(8)

  fields
  |> list.map(from_base_string(_, 16))
  |> list.each(fn(f) { should.be_true(f >= 0 && f <= 65_535) })
}

pub fn mac_test() {
  let fields = string.split(internet.mac(), ":")

  fields
  |> list.length
  |> should.equal(6)

  fields
  |> list.map(from_base_string(_, 16))
  |> list.each(fn(f) { should.be_true(f >= 0 && f <= 255) })
}

pub fn long_hex_color_test() {
  let color = internet.long_hex_color()

  let assert Ok(re) = regex.from_string("^#[0-9a-fA-F]{6}$")

  regex.check(re, color)
  |> should.be_true
}

pub fn short_hex_color_test() {
  let color = internet.short_hex_color()

  let assert Ok(re) = regex.from_string("^#[0-9a-fA-F]{3}$")

  regex.check(re, color)
  |> should.be_true
}

pub fn mongo_object_id_test() {
  let id = internet.mongo_object_id()

  let assert Ok(re) = regex.from_string("^[0-9a-fA-F]{24}$")

  regex.check(re, id)
  |> should.be_true
}

fn verify_username(username: String) -> Bool {
  list.any(
    string.to_graphemes(username),
    fn(g) { list.contains([".", "-", "_"], g) || string.uppercase(g) == g },
  )
}

fn verify_domain_name(domain_name: String) -> Bool {
  list.length(string.split(domain_name, ".")) > 1
}

external fn from_base_string(string: String, base: Int) -> Int =
  "erlang" "binary_to_integer"
