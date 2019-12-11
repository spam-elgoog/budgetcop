# frozen_string_literal: true

# Budget Detail Model
class BudgetDetail < ApplicationRecord
  belongs_to :budget_plan
  belongs_to :category
  before_destroy :check_last

  validates_uniqueness_of(:category_id, scope: :budget_plan_id, case_sensitive: false)
  validates :amount, numericality: true

  private

  def check_last
    # cancel find a reason so meet learning objective
    # throw(:abort)
  end
end
