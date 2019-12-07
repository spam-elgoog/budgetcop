# frozen_string_literal: true
module Types
  module Custom
    class UserType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: true, description: "Auto Generated ID"
      field :f_name, String, null: true, description: ""
      field :l_name, String, null: true, description: ""
      field :email, String, null: true, description: ""
      field :user_name, String, null: true, description: ""
      # field :password, String, null: false
      # field :plans_count, Integer, null: true
    end
  end
end
