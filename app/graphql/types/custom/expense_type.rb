# frozen_string_literal: true
module Types
  module Custom
    class ExpenseType < Types::BaseObject
      description "Represents a single Budget expense."
      field :id, ID, null: false, description: "Auto Generated ID"
      field :details, String, null: false, description: "User supplied Details of the expense"
      field :category_id, ID, null: false,
        description: "FK from Categories, the category is expenditure is tied to"
      field :amount, Float, null: false, description: "The amount of the expenditure"
      field :budget_plan_id, ID, null: false, description: "FK from Budget_Plans"
    end
  end
end
