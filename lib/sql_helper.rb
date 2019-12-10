# frozen_string_literal: true
module SqlHelper
  #
  # Expenses Query
  #
  SQL_BY_PLAN_ID_SUM_AMOUNTS_BY_CATEGORY = "SELECT expenses.budget_plan_id, expenses.category_id, expenses.details, SUM(expenses.amount) "\
  "AS amount, category.id, category.category, category.short_desc, category.full_desc "\
  "FROM expenses INNER JOIN categories category ON category.id = expenses.category_id WHERE "\
  "expenses.budget_plan_id = ? GROUP BY expenses.category_id"

  def sanitize_sql_query(sql, *params)
    sanitize_sql([sql, *params])
  end
end
