import gleam/int
import blah/utils.{get_random_item}

pub fn avatar(width: Int, height: Int) {
  let category = get_random_item(["portrait", "celebrity", "face", "smile"])
  with_category(width, height, category)
}

pub fn animal(width: Int, height: Int) {
  with_category(width, height, "animal")
}

pub fn cat(width: Int, height: Int) {
  with_category(width, height, "cat")
}

pub fn dog(width: Int, height: Int) {
  with_category(width, height, "dog")
}

pub fn food(width: Int, height: Int) {
  with_category(width, height, "food")
}

pub fn sports(width: Int, height: Int) {
  with_category(width, height, "sports")
}

pub fn people(width: Int, height: Int) {
  with_category(width, height, "people")
}

pub fn fashion(width: Int, height: Int) {
  with_category(width, height, "fasion")
}

pub fn with_category(width: Int, height: Int, category: String) {
  "https://loremflickr.com/" <> int.to_string(width) <> "/" <> int.to_string(
    height,
  ) <> "/" <> category <> "?lock=" <> int.to_string(int.random(4, 4_294_967_296))
}

pub fn whatever(width: Int, height: Int) {
  "https://picsum.photos/seed/" <> int.to_string(int.random(4, 4_294_967_296)) <> "/" <> int.to_string(
    width,
  ) <> "/" <> int.to_string(height)
}
