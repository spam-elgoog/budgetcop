# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :f_name, String, required: true
    argument :l_name, String, required: true
    argument :email, String, required: true
    argument :user_name, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    # this should be removed and adding admin
    # should be a different query
    # argument :admin, Boolean, required: false

    field :user, Types::Custom::UserType, null: false
    field :errors, [String], null: false
    def resolve(**args)
      user = User.new(args)
      if user.save
        {
          user: user,
          errors: [],
        }
      else
        {
          user: user,
          errors: user.errors.full_messages,
        }
      end
    end
  end
end
