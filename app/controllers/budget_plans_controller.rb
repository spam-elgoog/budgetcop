# frozen_string_literal: true
class BudgetPlansController < ApplicationController
  def index
    begin
      @budgets = BudgetPlan.where(user_id: current_user.id)
    rescue ActiveRecord::RecordNotFound => e
      render(json: { error: 'Budget plan not found for this user.' }, status: :not_found)
      return
    end

    respond_to do |format|
      format.html
      # as_json or to_json??
      format.json { render(json: @budgets.as_json(only: %i[id plan_date user_id])) }
    end
  end
end
