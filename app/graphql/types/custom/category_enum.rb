# frozen_string_literal: true
module Types
  module Custom
    class CategoryEnum < Types::BaseEnum
      value :supplies
      value :shipping
      value :transportation
      value :storage
      value :website
      value :permits
      value :utils
      value :ads
      value :apps
      value :refunds
      value :damages
      value :misc
    end
  end
end
