class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :f_name, limit: 20, null: false
      t.string :l_name , limit: 60, null: false
      t.string :email , limit: 80, null: false, index: { unique: true }
      t.string :user_name , limit: 30, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

