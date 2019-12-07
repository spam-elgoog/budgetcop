# frozen_string_literal: true
module Mutations
  class DeleteUser < BaseMutation
    # class DeleteUser < GraphQL::Schema::RelayClassicMutation
    # use this for autoloading the user based on the id
    # no need to call User.find(id)?
    # argument :id, ID, required: true # , loads: Types::Post
    argument :id, ID, required: true
    field :user, Types::Custom::UserType, null: true
    field :errors, [String], null: true
    field :info, String, null: true

    def resolve(id:)
      user = User.find(id)
      user.destroy!
      { info: "User deteleted" }
    rescue ActiveRecord::RecordNotFound => _e
      { errors: ['This user does not exist'] }
    rescue ActiveRecord::RecordNotDestroyed => _f
      { user: user, errors: user.errors.full_messages }
    end
  end
end
