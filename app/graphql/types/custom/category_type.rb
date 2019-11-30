# frozen_string_literal: true
module Types
  module Custom
    class CategoryType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.
      field :id, ID, null: false, description: "Auto Generated ID"
      field :category, String, null: false, description: ""
      field :short_desc, String, null: false, description: ""
      field :full_desc, String, null: false, description: ""
    end
  end
end
