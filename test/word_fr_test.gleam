import gleam/list
import blah/fr/word
import gleeunit/should
import blah/locales/fr/word as word_repo

pub fn verb_test() {
  list.contains(word_repo.verbs, word.verb())
  |> should.be_true
}

pub fn preposition_test() {
  list.contains(word_repo.prepositions, word.preposition())
  |> should.be_true
}

pub fn noun_test() {
  list.contains(word_repo.nouns, word.noun())
  |> should.be_true
}

pub fn interjection_test() {
  list.contains(word_repo.interjections, word.interjection())
  |> should.be_true
}

pub fn conjunction_test() {
  list.contains(word_repo.conjunctions, word.conjunction())
  |> should.be_true
}

pub fn adverb_test() {
  list.contains(word_repo.adverbs, word.adverb())
  |> should.be_true
}

pub fn adjective_test() {
  list.contains(word_repo.adjectives, word.adjective())
  |> should.be_true
}
