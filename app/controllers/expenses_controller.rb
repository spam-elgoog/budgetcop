# frozen_string_literal: true
class ExpensesController < ApplicationController
  # respond_to :json

  def index
    @budget_id = params[:budget_plan_id]
    unless @budget_id.blank?
      begin
        @plan = current_user.budget_plans.find(@budget_id)

      rescue ActiveRecord::RecordNotFound => e
        render(json: { error: 'Budget plan not found for this user.' }, status: :not_found)
        return
      end
      if @plan
        @expenses = Expense.where(budget_plan_id: @budget_id).order(:category_id)
        respond_to do |format|
          format.html
          # as_json or to_json??
          format.json { render(json: @expenses.as_json(only: %i[id category_id details amount])) }
        end
        return
      end
    end
    redirect_to(root_url, notice: 'You are not authorize, this action has been logged, further requests
      may lead to suspension of your account!')
  end
end
