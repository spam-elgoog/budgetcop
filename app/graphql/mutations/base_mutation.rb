# frozen_string_literal: true
module Mutations
  # This class is used as a parent for all mutations, and it is the place to have common utilities
  # I had this originally it worked but after watching tutorial changed to the other
  # not sure yet what the difference is ..perhaps very little an artifact from previous version?
  # class BaseMutation < GraphQL::Schema::Mutation
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    null false
  end
end
