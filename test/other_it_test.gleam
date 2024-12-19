import blah/fr/other
import gleam/list

import blah/locales/it/finance as finance_repo

pub fn currency_test() {
  list.contains(finance_repo.currencies, other.currency())
}
