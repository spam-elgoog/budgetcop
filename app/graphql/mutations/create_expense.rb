# frozen_string_literal: true
module Mutations
  class CreateExpense < BaseMutation
    argument :attributes, Types::Custom::ExpenseAttributes, required: true
    field :id, ID, null: true
    field :errors, [String], null: false

    def resolve(attributes:)
      # context[:current_user].id
      # TODO: verify this user owns this Budget plan id
      cat_id = Constants::CATEGORY_ENUMS[attributes.category.to_sym]
      new_expense = BudgetPlan.find(attributes.plan_id).expenses.create(category_id: cat_id) do |x|
        x.amount = attributes.amount
        x.details = attributes.details
      end
      if new_expense
        { id: new_expense.id, errors: Constants::EMPTY_ARRAY }
      else
        { id: nil, errors: new_expense.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound => _e
      { id: nil, errors: ['This monthly Budget does not exist please create it first.'] }
    end
  end
end
