# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    # this should be removed and adding admin
    # should be a different query
    # argument :admin, Boolean, required: false
    argument :attributes, Types::Custom::UserAttributes, required: true
    field :user, Types::Custom::UserType, null: true
    field :errors, [String], null: false
    def resolve(attributes:)
      # context[:current_user].id)
      user = User.new(attributes.to_hash)
      if user.save
        {
          user: user,
          errors: [],
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages,
        }
      end
    end
  end
end
