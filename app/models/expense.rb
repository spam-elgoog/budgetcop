# frozen_string_literal: true

# Expense Model
class Expense < ApplicationRecord
  include SqlHelper

  belongs_to :budget_plan
  belongs_to :category

  def sanitize_sql_query(sql, *params)
    sanitize_sql([sql, *params])
  end
end
