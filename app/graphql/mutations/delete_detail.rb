# frozen_string_literal: true
module Mutations
  class DeleteDetail < BaseMutation
    argument :id, ID, required: true
    field :detail, Types::Custom::PlanDetailType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      # TODO: check that the budget id is owned by current_user
      BudgetDetail.find(id).detail.destroy!
      { errors: [] }
    rescue ActiveRecord::RecordNotFound => _e
      { errors: ['This detail does not exist'] }
    rescue ActiveRecord::RecordNotDestroyed => _f
      { detail: detail, errors: detail.errors.full_messages }
    end
  end
end
