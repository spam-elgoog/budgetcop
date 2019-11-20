# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  has_many :budget_plans, dependent: :destroy
  has_many :budget_details, through: :budget_plans
  # This is for the bcrypt gem
  has_secure_password
end
