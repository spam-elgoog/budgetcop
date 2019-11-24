# frozen_string_literal: true
class CreateBudgetDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_details do |t|
      t.references(:category, null: false, foreign_key: true)
      t.references(:budget_plan, null: false, foreign_key: true)
      t.decimal(:amount, null: false, scale: 2, precision: 16)

      t.timestamps
    end
    add_index(:budget_details, %i[budget_plan_id category_id], unique: true)
  end
end
