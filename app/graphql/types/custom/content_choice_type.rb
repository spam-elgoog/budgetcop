module Types
  module Custom
    class ContentChoiceType < Types::BaseEnum
      value :ALL, 'All available records'
      value :NEWEST, 'First based on the order'
      value :OLDEST, 'Last order based'
    end
  end
end