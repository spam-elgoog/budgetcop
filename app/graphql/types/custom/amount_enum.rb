# frozen_string_literal: true
module Types
  module Custom
    class AmountEnum < Types::BaseEnum
      value :COMBINED, 'Uses Group By and sums up items one column'
      value :INDIVIDUAL, 'Returns all individual items does not group anything'
    end
  end
end