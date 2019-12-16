# frozen_string_literal: true
module Types
  module Custom
    class UserType < Types::BaseObject
      description "Used for returning user detail or list of users"
      field :id, ID, null: true, description: "Auto Generated ID"
      field :f_name, String, null: true, description: "First name"
      field :l_name, String, null: true, description: "Last name"
      field :email, String, null: true, description: "email"
      field :user_name, String, null: true, description: "user_name"
      field :created_at, String, null: true, description: "user_name"
      field :updated_at, String, null: true, description: "user_name"
      field :budget_plans, [Types::Custom::BudgetPlanType], null: true, description: "user_name"
    end
  end
end
