# frozen_string_literal: true
module Types
  module Custom
    class ExpenseAttributes < Types::BaseInputObject
      description "Attributes for creating or updating an expense"
      argument :plan_id, ID, required: true
      argument :category, Types::Custom::CategoryEnum, required: true
      argument :details, String, required: true
      argument :amount, Float, required: true
    end
  end
end