# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :delete_user,
      mutation: Mutations::DeleteUser,
      description: 'Delete a user. In the future this will only be allowed by admin user.'

    field :create_user,
      mutation: Mutations::CreateUser,
      description: 'Creates a new user.'

    field :delete_detail,
      mutation: Mutations::DeleteDetail,
      description: 'Delete one budget category detail.'
  end
end
