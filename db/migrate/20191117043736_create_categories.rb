# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string(:category, limit: 24, null: false)
      t.string(:short_desc, limit: 64, null: false)
      t.string(:full_desc, limit: 255)

      t.timestamps
    end
    add_index(:categories, :category, unique: true)
  end
end
