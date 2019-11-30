class RemoveForeignKeyPlan < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key(:budget_details, column: :budget_plan_id)
  end
end
