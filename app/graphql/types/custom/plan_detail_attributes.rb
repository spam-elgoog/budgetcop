# frozen_string_literal: true
module Types
  module Custom
    class PlanDetailAttributes < Types::BaseInputObject
      description "Attributes for creating or updating Plan Details"
      argument :category_id, ID, required: false
      argument :category_type, Types::Custom::CategoryEnum, required: true
      argument :amount, Float, required: true
    end
  end
end
