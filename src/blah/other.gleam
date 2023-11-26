import gleam/int
import gleam/list
import gleam/float
import gleam/string
import blah/en/other
import blah/utils.{get_random_item}

pub fn currency() {
  other.currency()
}

pub fn latitude() {
  float.random(-90.0, 90.0)
}

pub fn longitude() {
  float.random(-180.0, 180.0)
}

pub fn language_code() {
  get_random_item(language_codes)
}

pub fn semver() {
  list.repeat("", int.random(2, 4))
  |> list.map(fn(_) { int.random(0, 32) })
  |> list.map(int.to_string)
  |> string.join(".")
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

pub fn uuid() {
  list.repeat("", 32)
  |> list.map(fn(_) { int.random(0, 15) })
  |> list.map(fn(digit) {
    digit
    |> int.to_base16
    |> string.lowercase
  })
  |> list.fold(
    "",
    fn(uuid, char) {
      let uuid = string.append(uuid, char)
      case string.length(uuid) {
        8 | 13 | 18 | 23 -> string.append(uuid, "-")
        _ -> uuid
      }
    },
  )
}

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
