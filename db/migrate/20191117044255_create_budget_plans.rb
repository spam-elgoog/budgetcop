class CreateBudgetPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.date :plan_date, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
