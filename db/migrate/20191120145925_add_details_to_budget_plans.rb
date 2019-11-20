class AddDetailsToBudgetPlans < ActiveRecord::Migration[6.0]
  def change
    remove_index :budget_plans, column: :plan_date
    add_index :budget_plans, %i[user_id plan_date], unique: true
  end
end
