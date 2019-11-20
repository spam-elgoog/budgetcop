# frozen_string_literal: true

# Expense Model
class Expense < ApplicationRecord
  belongs_to :budget_plan
  belongs_to :category
end
