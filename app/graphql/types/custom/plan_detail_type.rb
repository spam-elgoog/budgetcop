# frozen_string_literal: true
module Types
  module Custom
    class PlanDetailType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: false, description: "Auto Generated ID"
      field :category_id, ID, null: false, description: "FK from Categories"
      field :amount, Float, null: false, description: "The amount this user budgeted on this Category"
      field :budget_plan_id, ID, null: false, description: "FK from Budget_Plans"
    end
  end
end
