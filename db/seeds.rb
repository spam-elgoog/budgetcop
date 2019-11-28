# frozen_string_literal: true
require_relative 'data_helper'

# Categories Table
Category.connection.execute('ALTER TABLE `categories` AUTO_INCREMENT = 1')
populate_categories

# Users Table
User.connection.execute('ALTER TABLE `users` AUTO_INCREMENT = 1')
populate_users

# Budget_Plans Table
BudgetPlan.connection.execute('ALTER TABLE `budget_plans` AUTO_INCREMENT = 1')
populate_plans

# Budget_Details Table
@plans = BudgetPlan.all
BudgetDetail.connection
  .execute('ALTER TABLE `budget_details` AUTO_INCREMENT = 1')
populate_details(@plans)

# Expenses Table
Expense.connection.execute('ALTER TABLE `expenses` AUTO_INCREMENT = 1')
populate_expenses(@plans)
