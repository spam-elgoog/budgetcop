# frozen_string_literal: true
module Constants
  EMPTY_ARRAY = []

  MINIMUM_ADMIN_USERS = 2

  CATEGORY_ENUMS = {
    supplies: 1,
    shipping: 2,
    transportation: 3,
    storage: 4,
    website: 5,
    permits: 6,
    utils: 7,
    ads: 8,
    apps: 9,
    refunds: 10,
    damages: 11,
    misc: 12,
  }

  FIRST_NAME_VALID_RANGE = (2..20)
  LAST_NAME_VALID_RANGE = (2..20)
  USER_NAME_VALID_RANGE = (7..30)
  PASSWORD_VALID_RANGE = (8..255)
  EMAIL_VALID_RANGE = (8..80)
end
