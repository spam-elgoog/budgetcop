# frozen_string_literal: true
require 'test_helper'

module Mutations
  class CreateUserTest < ActiveSupport::TestCase

    def perform(**args)
      Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
    end

    #
    # Testing required
    # 1.  if invalid user, return nil for :user and return with errors, record should not exist
    #     in the db
    # 2. if valid user is saved and all information saved is what was supplied
    # 3. check that if admin was not supplied the user is save with admin == false by default
    # 
    test 'invalid password' do

      resp = perform(attributes: {f_name: 'Bob', l_name: 'Smith', email: 'smith@gm.com', user_name: 'bobsmither'})
      puts "Whats thiss #{resp}"
      if resp[:user].nil?
        errors = resp[:errors]

        # puts "my eerrorrroorr #{errors[:blank]}"
        # assert_equal true, errors[:blank]
      end
      # serv = service[:service]
    end

      # assert_equal user.f_name, 'Ahmeds'
      # assert_equal user.l_name, 'Soright'

          # user = perform(
          #   f_name: 'Ahmed',
          #   l_name: 'Soright',
          #   email: 'ahmed@gm.com',
          #   username: 'ahmedsoright',
          #   password: 'password',
          #   password_confirmation: 'password',
          # )

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

