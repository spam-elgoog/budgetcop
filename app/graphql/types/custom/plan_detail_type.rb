# frozen_string_literal: true
module Types
  module Custom
    class PlanDetailType < Types::BaseObject
      description "Represents a single detail in a Budget Plan"
      field :id, ID, null: true, description: "Auto Generated ID"
      field :category_id, ID, null: true, description: "FK from Categories"
      field :amount, Float, null: true, description: "The amount this user budgeted on this Category"
      field :budget_plan_id, ID, null: true, description: "FK from Budget_Plans"
      field :category, String, null: true, description: "FK from Budget_Plans"
      field :short_desc, String, null: true, description: "FK from Budget_Plans"
    end
  end
end
 