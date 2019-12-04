# frozen_string_literal: true
module Types
  module Custom
    class BudgetPlanType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: false, description: "Auto Generated ID"
      field :plan_date, String, null: false, description: ""
      # this is redundant but its here to make things simpler for front end
      field :year, Integer, null: false, description: 'The year this monthly budget corresponds to.'
      field :month, String, null: false, description: "The budgeted month."
    end
  end
end
