import blah/it/lorem
import blah/locales/it/lorem as lorem_repo
import gleam/list

pub fn word_test() {
  list.contains(lorem_repo.words, lorem.word())
}
