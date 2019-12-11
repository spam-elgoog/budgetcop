# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  has_many :budget_plans, dependent: :destroy
  has_many :budget_details, through: :budget_plans, dependent: :destroy
  has_many :expenses, through: :budget_plans, dependent: :destroy

  before_destroy :check_last
  has_secure_password

  validates :f_name, :l_name, :email, :user_name, :password, presence: true

  validates :f_name, length: { within: Constants::FIRST_NAME_VALID_RANGE }
  validates :l_name, length: { within: Constants::LAST_NAME_VALID_RANGE }
  validates :user_name, length: { within: Constants::USER_NAME_VALID_RANGE }
  validates :password, length: { within: Constants::PASSWORD_VALID_RANGE }
  validates :email, length: { within: Constants::EMAIL_VALID_RANGE }

  validates :user_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters are allowed." }
  validates :user_name,
    uniqueness: { case_sensitive: false,
      message: ->(obj, data) do
        "Hey #{obj.f_name}!, #{data[:value]} is taken already... try again."
      end
    }

  validates_uniqueness_of(:email, case_sensitive: false)
  # TODO: add aditional validation to email, user_name, password etc
  # validates_with BudgetCopValidator, fields: [:email, :user_name, :password]

  private

  def check_last
    if User.where(admin: true).count <= Constants::MINIMUM_ADMIN_USERS
      errors[:base] << 'Cannot delete this admin user, you need minimum of two.'
      throw(:abort)
    end
  end
end
