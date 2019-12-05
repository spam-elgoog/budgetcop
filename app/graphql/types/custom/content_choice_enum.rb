# frozen_string_literal: true
module Types
  module Custom
    class ContentChoiceEnum < Types::BaseEnum
      value :ALL, 'All available records'
      value :NEWEST, 'First based on the order'
      value :OLDEST, 'Last order based'
    end
  end
end
