class RemoveForeignKeyPlanFromExpenses < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key(:expenses, column: :budget_plan_id)
  end
end
