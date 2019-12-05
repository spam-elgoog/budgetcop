# frozen_string_literal: true

module Mutations
  class CreatePlanDetail < BaseMutation
    argument :user_id, ID, required: true, description: 'User ID you are creating a plan detail for'
    argument :attributes, Types::Custom::PlanDetailAttributes, required: true
    field :id, ID, null: true
    field :errors, [String], null: false

    def resolve(user_id:, attributes:)
      # context[:current_user].id 
      plan_detail = BudgetPlan.find(attributes.budget_plan_id)&.budget_details
        .find_or_create_by(category_id: attributes.category_id) do |detail|
        detail.amount = attributes.amount
      end
      { id: plan_detail.id, errors: Constants::EMPTY_ARRAY}
    rescue ActiveRecord::RecordNotFound => _e
      { id: nil, errors: ['The Budget Plan you are looking for does not exist.']}
    end
  end
end
