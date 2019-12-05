# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  has_many :budget_plans, dependent: :destroy
  has_many :budget_details, through: :budget_plans, dependent: :destroy
  has_many :expenses, through: :budget_plans, dependent: :destroy

  before_destroy :check_last

  # This is for the bcrypt gem
  has_secure_password

  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  private

  def check_last
    # cancel find a reason so meet learning objective
    # throw(:abort)
  end
end
