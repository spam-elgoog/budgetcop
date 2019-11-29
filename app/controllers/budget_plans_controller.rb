# frozen_string_literal: true
class BudgetPlansController < ApplicationController
  def index
    @budgets = BudgetPlan.where(user_id: current_user.id)
    if @budgets.present?
      respond_to do |format|
        format.html
        # as_json or to_json??
        format.json { render(json: @budgets.as_json(only: %i[id plan_date user_id])) }
      end
    else
      render(json: { error: 'You do not have any Budget Plans yet.' }, status: :not_found)
    end
  end
end
