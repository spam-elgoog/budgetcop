# frozen_string_literal: true
module Mutations
  class SignInUser < BaseMutation
    null true

    argument :auth, Types::Custom::AuthorizationInput, required: false

    field :token, String, null: true
    field :user, Types::Custom::UserType, null: true
    field :errors, [String], null: false

    def resolve(auth: nil)
      # basic validation
      if auth.username.present?
        user = User.find_by(user_name: auth[:username])
        if user&.authenticate(auth[:password])
          session = context[:session]
          session[:token] = user.id
          # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
          crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
          token = crypt.encrypt_and_sign(session[:token])
          context[:session][:token] = token
          { user: user, token: token, errors: Constants::EMPTY_ARRAY }
        else
          { user: nil, token: nil, errors: ["Not authenticated"] }
        end
      else
        { user: nil, token: nil, errors: ["Invalid user creadentials"] }
      end
    end
  end
end