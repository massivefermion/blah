import blah/locales/fa/word
import blah/utils.{get_random_item}

pub fn verb() {
  assert Ok(verb) = get_random_item(word.verbs)
  verb
}

pub fn preposition() {
  assert Ok(preposition) = get_random_item(word.prepositions)
  preposition
}

pub fn noun() {
  assert Ok(noun) = get_random_item(word.nouns)
  noun
}

pub fn interjection() {
  assert Ok(interjection) = get_random_item(word.interjections)
  interjection
}

pub fn conjunction() {
  assert Ok(conjunction) = get_random_item(word.conjunctions)
  conjunction
}

pub fn adverb() {
  assert Ok(adverb) = get_random_item(word.adverbs)
  adverb
}

pub fn adjective() {
  assert Ok(adjective) = get_random_item(word.adjectives)
  adjective
}
