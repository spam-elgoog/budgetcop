# frozen_string_literal: true
module Types
  module Custom
    class UserAttributes < Types::BaseInputObject
      description "Attributes for creating or updating a User"
      argument :f_name, String, required: true
      argument :l_name, String, required: true
      argument :email, String, required: true
      argument :user_name, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
    end
  end
end
