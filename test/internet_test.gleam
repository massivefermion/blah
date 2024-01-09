import gleam/uri
import gleam/int
import gleam/list
import gleam/regex
import gleam/string
import gleeunit/should
import blah/other
import blah/internet

pub fn email_test() {
  let email_parts = string.split(internet.email("simon"), "@")

  list.length(email_parts)
  |> should.equal(2)

  let assert [_username, domain] = email_parts

  let domain_parts = string.split(domain, ".")

  list.length(domain_parts)
  |> should.equal(2)
}

pub fn passphrase_test() {
  let passphrase_parts = string.split(internet.passphrase(), " ")

  list.length(passphrase_parts)
  |> should.equal(4)
}

pub fn uri_test() {
  internet.uri()
  |> uri.parse
  |> should.be_ok
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
  |> list.map(int.base_parse(_, 16))
  |> list.map(should.be_ok)
  |> list.each(fn(f) { should.be_true(f >= 0 && f <= 65_535) })
}

pub fn mac_test() {
  let fields = string.split(internet.mac(), ":")

  fields
  |> list.length
  |> should.equal(6)

  fields
  |> list.map(int.base_parse(_, 16))
  |> list.map(should.be_ok)
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
  let id = other.mongo_object_id()

  let assert Ok(re) = regex.from_string("^[0-9a-fA-F]{24}$")

  regex.check(re, id)
  |> should.be_true
}
