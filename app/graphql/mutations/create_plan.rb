# frozen_string_literal: true

module Mutations
  class CreatePlan < BaseMutation
    argument :plan_date, String, required: false
    argument :id, ID, required: true
    field :budget_plan, Types::Custom::BudgetPlanType, null: true
    field :errors, [String], null: false

    def resolve(id:, plan_date: nil)
      plan_date = BudgetPlan.db_date(plan_date)
      return send_me(nil, errors: ['Invalid date']) unless plan_date

      if BudgetPlan.where(user_id: id, plan_date: plan_date).first.nil?
        # TODO: update with currently logged in user
        # context[:current_user].id
        plan = BudgetPlan.new(user_id: id, plan_date: plan_date)
        if plan.save
          send_me(plan, [])
        else
          send_me(nil, plan.errors.full_messages)
        end
      else
        send_me(nil, ['Budget plan already exists.'])
      end
    end

    private

    def send_me(plan, errors)
      {
        budget_plan: plan,
        errors: errors,
      }
    end
  end
end
