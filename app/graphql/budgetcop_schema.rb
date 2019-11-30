# frozen_string_literal: true
class BudgetcopSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
