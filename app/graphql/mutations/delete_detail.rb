# frozen_string_literal: true
module Mutations
  class DeleteDetail < BaseMutation
    # use this for autoloading the user based on the id
    # no need to call User.find(id)?
    # argument :post_id, ID, required: true, loads: Types::Post

    argument :id, ID, required: true
    type Types::Custom::PlanDetailType
    # type String
    def resolve(id:)
      detail = BudgetDetail.find(id)

      detail unless detail.destroy
      # ? (PlanDetailType: detail, errors: []) : (PlanDetailType: detail, errors: detail.errors.full_messages)
      # , detail.errors.full_messages
      # "Detail was deleted ID #{detail.id} with this Budget Plan id #{detail.budget_plan_id} and
      # category #{detail.category_id}" unless detail
    end
  end
end
