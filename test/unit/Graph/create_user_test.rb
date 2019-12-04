# frozen_string_literal: true
require 'test_helper'

module Graphql
  module Mutations
    class CreateUserTest < ActiveSupport::TestCase
      def perform(_user: nil, **args)
        Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
      end

      test 'create a new User' do
        user = perform(
          f_name: 'Ahmed',
          l_name: 'Soright',
          email: 'ahmed@gm.com',
          username: 'ahmedsoright',
          password: 'password',
          password_confirmation: 'password',
        )

        assert user.persisted?
        assert_equal user.f_name, 'Ahmeds'
        assert_equal user.l_name, 'Soright'

        # test "delete" do
        #   collection = collections(:snowboards)
        #   shop_id = GraphApi::Admin::Shop.build_global_id(@shop.id).to_s
        #   refute_nil @shop.collections.find(collection.id)
        #   assert_statsd_increment('graphql.admin.collections.delete',
        #     tags: { type: 'SmartCollection', status: CollectionsLogging::STATUS_SUCCESS }) do
        #     on_mutation(
        #       args: { input: { id: GraphApi::Admin::Collection.build_global_id(collection.id).to_s } },
        #       selections: [:deleted_collection_id, { shop: :id }]
        #     ) do
        #       assert_no_errors
        #       assert_no_user_errors
        #       assert_field :shop do |value|
        #         assert_equal shop_id, value[:id]
        #       end
        #     end
        #   end
        #   # assert_raises(ActiveRecord::RecordNotFound) { @user.find(id) }
        #   assert_raises(ActiveRecord::RecordNotFound) { @shop.collections.find(collection.id) }
        # end
      end
    end
  end
end
