# frozen_string_literal: true
module Types
  module Custom
    class PlanDetailType < Types::BaseObject
      description "Represents a single detail in a Budget Plan"
      field :budget_plan_id, ID, null: true, description: "FK from Budget_Plans"
      field :id, ID, null: true, description: "Auto Generated ID"
      field :amount, Float, null: true, description: "The amount this user budgeted on this Category"
      field :category, Types::Custom::CategoryType, null: true, description: "Category details"
      # field :category_id, ID, null: true, description: "FK from Categories"
      # field :category, String, null: true, description: "category"
      # field :short_desc, String, null: true, description: "short description"
    end
  end
end
 