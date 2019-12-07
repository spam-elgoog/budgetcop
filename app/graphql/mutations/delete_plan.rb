# frozen_string_literal: true
module Mutations
  class DeletePlan < BaseMutation
    # use this for autoloading the user based on the id
    # no need to call User.find(id)?
    # argument :post_id, ID, required: true, loads: Types::Post

    argument :user_id, ID, required: true
    argument :plan_id, ID, required: true

    field :budget_plan, Types::Custom::BudgetPlanType, null: true
    field :errors, [String], null: false
    # type String
    def resolve(plan_id:, user_id:)
      # plan = BudgetPlan.find(id)
      plan = BudgetPlan.where(id: plan_id, user_id: user_id).first
      if plan.present?
        plan.destroy
        { budget_plan: plan, errors: [] }
      else
        { budget_plan: nil, errors: ['This budget plan does not exist'] }
      end
    end
  end
end
