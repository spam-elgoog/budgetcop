# frozen_string_literal: true

module Mutations
  class CreatePlan < BaseMutation
    argument :plan_date, String, required: false
    argument :user_id, ID, required: true
    field :budget_plan, Types::Custom::BudgetPlanType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, plan_date: nil)
      plan_date = BudgetPlan.db_date(plan_date)
      return { budget_plan: nil, errors: ['Invalid date'] } unless plan_date

      # TODO: update with currently logged in user
      # context[:current_user].id
      plan = BudgetPlan.find_or_create_by(user_id: user_id, plan_date: plan_date)
      if plan.save
        { budget_plan: plan, errors: Constants::EMPTY_ARRAY }
      else
        { budget_plan: nil, errors: plan.errors.full_messages }
      end
    end
  end
end
