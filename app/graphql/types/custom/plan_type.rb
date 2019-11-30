# frozen_string_literal: true
module Types
  module Custom
    class PlanType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: false, description: "Auto Generated ID"
      field :plan_date, String, null: false, description: ""
    end
  end
end
