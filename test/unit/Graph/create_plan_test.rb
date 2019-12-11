# frozen_string_literal: true
require 'test_helper'

module Graphql
  module Mutations
    class CreatePlanTest < ActiveSupport::TestCase
      def perform(*args)
        CreatePlan.new(object: nil, context: {}).resolve(args)
      end

      # test 'create a new User' do
      #   plan = perform(service_input: ServiceType.new('massage', 50))
      # end

    end
  end
end