import blah/locales/en/finance
import blah/utils.{get_random_item}

pub fn currency() {
  get_random_item(finance.currencies)
}
