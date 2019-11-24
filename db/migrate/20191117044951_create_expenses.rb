# frozen_string_literal: true
class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string(:details, limit: 255, null: false)
      t.decimal(:amount, null: false, scale: 2, precision: 16)
      t.references(:category, null: false, foreign_key: true)
      t.references(:budget_plan, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
