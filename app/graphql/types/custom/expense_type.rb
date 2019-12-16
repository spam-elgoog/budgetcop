# frozen_string_literal: true
module Types
  module Custom
    class ExpenseType < Types::BaseObject
      description "Represents a single Budget expense."
      field :id, ID, null: false, description: "Auto Generated ID"
      field :details, String, null: false, description: "User supplied Details of the expense"
      field :amount, Float, null: false, description: "The amount of the expenditure"
      field :budget_plan_id, ID, null: false, description: "FK from Budget_Plans"
      field :category, Types::Custom::CategoryType, null: true, description: "Category details"
      field :budget_plan, Types::Custom::BudgetPlanType, null: true, description: "Related to"
    end
  end
end
