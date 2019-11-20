# frozen_string_literal: true

# Budget Detail Model
class BudgetDetail < ApplicationRecord
  belongs_to :budget_plan
  belongs_to :category
end
