class RemoveForeignKeyUsersFromPlan < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key(:budget_plans, column: :user_id)
  end
end
