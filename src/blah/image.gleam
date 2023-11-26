import gleam/int
import blah/utils.{get_random_item}

pub fn avatar(width: Int, height: Int) {
  let category = get_random_item(["portrait", "celebrity", "face", "smile"])
  with_category(category, width, height)
}

pub fn animal(width: Int, height: Int) {
  with_category("animal", width, height)
}

pub fn sloth(width: Int, height: Int) {
  with_category("sloth", width, height)
}

pub fn jellyfish(width: Int, height: Int) {
  with_category("jellyfish", width, height)
}

pub fn cat(width: Int, height: Int) {
  with_category("cat", width, height)
}

pub fn dog(width: Int, height: Int) {
  with_category("dog", width, height)
}

pub fn food(width: Int, height: Int) {
  with_category("food", width, height)
}

pub fn sports(width: Int, height: Int) {
  with_category("sports", width, height)
}

pub fn people(width: Int, height: Int) {
  with_category("people", width, height)
}

pub fn fashion(width: Int, height: Int) {
  with_category("fashion", width, height)
}

pub fn with_category(category: String, width: Int, height: Int) {
  "https://loremflickr.com/" <> int.to_string(width) <> "/" <> int.to_string(
    height,
  ) <> "/" <> category <> "?lock=" <> int.to_string(int.random(4, 4_294_967_296))
}

pub fn whatever(width: Int, height: Int) {
  "https://picsum.photos/seed/" <> int.to_string(int.random(4, 4_294_967_296)) <> "/" <> int.to_string(
    width,
  ) <> "/" <> int.to_string(height)
}
