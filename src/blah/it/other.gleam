import blah/utils

import blah/locales/it/finance

pub fn currency() {
  utils.get_random_item(finance.currencies)
}
