# frozen_string_literal: true
class ExpensesController < ApplicationController
  # respond_to :json

  def index
    @budget_id = params[:budget_plan_id]
    if @budget_id.present?
      begin
        # Keep this instance variable for now for HTML view 
        @plan = current_user.budget_plans.find(@budget_id)

      rescue ActiveRecord::RecordNotFound => e
        render(json: { error: 'Budget plan not found for this user. Do not make me suspend you.' }, status: :not_found)
        return
      end

      # TODO: test what this displays if there are no expenses found
      @expenses = Expense.where(budget_plan_id: @budget_id).order(:category_id)
      respond_to do |format|
        format.html
        # as_json or to_json??
        format.json { render(json: @expenses.as_json(only: %i[id category_id details amount])) }
      end
      return
    end
    redirect_to(root_url, notice: 'Unauthorized request')
  end
end
