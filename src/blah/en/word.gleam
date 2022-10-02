//// same as `blah/word`

import blah/locales/en/word
import blah/utils.{get_random_item}

pub fn verb() {
  assert Ok(verb) =
    word.verbs
    |> get_random_item
  verb
}

pub fn preposition() {
  assert Ok(preposition) =
    word.prepositions
    |> get_random_item
  preposition
}

pub fn noun() {
  assert Ok(noun) =
    word.nouns
    |> get_random_item
  noun
}

pub fn interjection() {
  assert Ok(interjection) =
    word.interjections
    |> get_random_item
  interjection
}

pub fn conjunction() {
  assert Ok(conjunction) =
    word.conjunctions
    |> get_random_item
  conjunction
}

pub fn adverb() {
  assert Ok(adverb) =
    word.adverbs
    |> get_random_item
  adverb
}

pub fn adjective() {
  assert Ok(adjective) =
    word.adjectives
    |> get_random_item
  adjective
}
