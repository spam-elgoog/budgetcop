# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :delete_user,
      mutation: Mutations::DeleteUser,
      description: 'Delete a user. In the future this will only be allowed by admin user.'

    field :create_user,
      mutation: Mutations::CreateUser,
      description: 'Creates a new user.'

    field :create_plan_detail,
      mutation: Mutations::CreatePlanDetail,
      description: 'Create plan detail.'

    field :delete_detail,
      mutation: Mutations::DeleteDetail,
      description: 'Delete one budget category detail.'

    field :create_plan,
      mutation: Mutations::CreatePlan,
      description: 'Create new Budget.'

    field :delete_plan,
      mutation: Mutations::DeletePlan,
      description: 'Deletes Budget Plan.'

    field :sign_in_user,
    mutation: Mutations::SignInUser,
    description: 'Sign in'
  end
end
