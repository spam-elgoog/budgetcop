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
    end
   
    # def perform(user: nil, **args)
    #   Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
    # end
  
    # test 'create a new link' do
    #   link = perform(
    #     url: 'http://example.com',
    #     description: 'description',
    #   )
  
    #   assert link.persisted?
    #   assert_equal link.description, 'description'
    #   assert_equal link.url, 'http://example.com'
    # end

  end
end

