import blah/locales/fa/word
import blah/utils.{get_random_item}

pub fn verb() {
  get_random_item(word.verbs)
}

pub fn preposition() {
  get_random_item(word.prepositions)
}

pub fn noun() {
  get_random_item(word.nouns)
}

pub fn interjection() {
  get_random_item(word.interjections)
}

pub fn conjunction() {
  get_random_item(word.conjunctions)
}

pub fn adverb() {
  get_random_item(word.adverbs)
}

pub fn adjective() {
  get_random_item(word.adjectives)
}
