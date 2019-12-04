# frozen_string_literal: true
class HashMapper < Array
  def initialize(data)
    super(data)
  end

  def map_to_keys(keys)
    map! do |item|
      Hash[keys.zip(item)]
    end
  end
end
