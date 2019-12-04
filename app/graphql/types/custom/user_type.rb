# frozen_string_literal: true
module Types
  module Custom
    class UserType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: false, description: "Auto Generated ID"
      field :f_name, String, null: false, description: ""
      field :l_name, String, null: false, description: ""
      field :email, String, null: false, description: ""
      field :user_name, String, null: false, description: ""
      # field :password, String, null: false
      field :plans_count, Integer, null: true

      private

      # def plans_count
      #   { plans_count: object.budget_plans.size}
      #   # can be anything like size whatever makes sense
      #   # object.plans.size
      # end

      # def current_plan?
      #   # return if user has a current month plan avail
      # end
    end
  end
end
