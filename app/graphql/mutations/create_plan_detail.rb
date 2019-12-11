# frozen_string_literal: true

module Mutations
  class CreatePlanDetail < BaseMutation
    argument :user_id, ID, required: true, description: 'User ID you are creating a plan detail for'
    argument :budget_plan_id, ID, required: true
    argument :attributes, [Types::Custom::PlanDetailAttributes], required: true
    field :id, ID, null: true
    field :errors, [String], null: false

    def resolve(user_id:, budget_plan_id:, attributes:)
      # TODO: context[:current_user].id
      plan = BudgetPlan.find(budget_plan_id)
      attributes.each do |item|

        category_id = Constants::CATEGORY_ENUMS[item.category_type.to_sym]

        plan_detail = plan.budget_details
          .where(category_id: category_id)
          .first

        if plan_detail
          plan_detail.update(amount: item.amount)
        else
          # create this detail
          plan.budget_details
            .create(category_id: category_id, amount: item.amount)
        end

      rescue ActiveRecord::RecordNotFound => _e
        {  errors: ["The Budget Detail you are looking for does not exist. #{item.category}"] }
      end
      { errors: Constants::EMPTY_ARRAY }
    rescue ActiveRecord::RecordNotFound => _e
      { id: nil, errors: ['The Budget Plan you are looking for does not exist.'] }
    end
  end
end
