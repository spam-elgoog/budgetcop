# frozen_string_literal: true
module Mutations
  class DeleteUser < BaseMutation
    # class DeleteUser < GraphQL::Schema::RelayClassicMutation
    # use this for autoloading the user based on the id
    # no need to call User.find(id)?
    # argument :id, ID, required: true # , loads: Types::Post
    argument :id, ID, required: true
    type Types::Custom::UserType
    # many ways to return values, not sure which ones maybe outdated
    #
    # field :user, Types::Custom::UserType, null: false
    # field :msg, String, null: false
    # return_field :errors, types.String

    def resolve(id:)
      user = User.find(id)
      user unless user.destroy!
      # { user: user, errors: "User was Deleted" }
    end
  end
end
