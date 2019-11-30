# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    # ************************************************************************
    #
    # Users
    #
    # Retrieve all available users
    field :all_users,
      [Types::Custom::UserType],
      null: false,
      description: 'Returns all signed up users including admins, this should be an
      admin view only.'
    # this method is invoked, when `all_users` fields is being resolved
    def all_users
      User.all
    end

    field :user, Custom::UserType, null: false do
      description 'Returns user details.'
      argument :id, ID, 'Get details of the user with this ID ', required: true
    end
    # this method is invoked, when `all_users` fields is being resolved
    def user(id:)
      User.find(id)
    end

    # ************************************************************************
    #
    # Categories
    #
    # Retrieve all system defined Categories
    field :all_categories,
      [Custom::CategoryType],
      null: false,
      description: 'Returns all supported budget plan categories'

    # this method is invoked, when `all_users` fields is being resolved
    # this method has access to object and context
    def all_categories
      Category.all
    end

    # ************************************************************************
    #
    # Budget Plans
    #
    field :all_plans_by_user_id, [Custom::PlanType], null: true do
      description "Find plans by a user id"
      argument :id, ID, 'Get plans based on this ID ', required: true
    end

    # this method is invoked, when `all_users` fields is being resolved
    def all_plans_by_user_id(id:)
      BudgetPlan.where(user_id: id)
    end

    # ************************************************************************
    #
    # Budget Details
    #
    #
    field :all_details_by_plan_id, [Custom::PlanDetailType], null: true do
      description "Find plans by a user id"
      argument :id, ID, 'Get details based on this plan ID ', required: true
    end
    # this method is invoked, when `all_users` fields is being resolved
    def all_details_by_plan_id(id:)
      BudgetDetail.where(budget_plan_id: id)
    end

    # ************************************************************************
    #
    # Budget Expenses
    #
    # Find Expenses by plan ID
    field :all_expenses_by_plan_id, [Custom::ExpenseType], null: true do
      description "Find Expenses by a plan id"
      argument :id, ID, 'Get expenses based on this plan ID ', required: true
    end
    # Find expenses by plan ID
    def all_expenses_by_plan_id(id:)
      Expense.where(budget_plan_id: id)
    end

    # field :user, UserType, null: false do
    #   argument :user_name, String, required: true
    # end

    # def user(user_name:)
    #   User.find_by(user_name: user_name)
    # end
  end
end
