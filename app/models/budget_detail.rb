# frozen_string_literal: true

# Budget Detail Model
class BudgetDetail < ApplicationRecord
  belongs_to :budget_plan
  belongs_to :category
  before_destroy :check_last

  private

  def check_last
    # cancel find a reason so meet learning objective
    # throw(:abort)
  end
end
