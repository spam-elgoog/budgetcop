# frozen_string_literal: true
module Mutations
  class DeleteDetail < BaseMutation
    argument :id, ID, required: true
    field :detail, Types::Custom::PlanDetailType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      # TODO: check that the budget id is owned by current_user
      detail = BudgetDetail.find(id)

      if detail.present?
        detail.destroy
        { detail: detail, errors: [] }
      else
        { detail: nil, errors: ['This budget plan detail item does not exist'] }
      end
    end
  end
end
