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

    # **************************************************
    field :all_expenses,
      [Types::Custom::ExpenseType],
      null: true,
      description: "Find Expenses by a plan id"

    def all_expenses
      Expense.all
    end

    field :user, Types::Custom::UserType, null: false do
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
      [Types::Custom::CategoryType],
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
    field :all_plans_by_user_id, [Types::Custom::BudgetPlanType], null: true do
      description "Find plans by a user id"
      argument :user_id, ID, 'Get plans based on this ID ', required: true
      argument :content_choice, Types::Custom::ContentChoiceEnum, required: true
    end

    # this method is invoked, when `all_users` fields is being resolved
    def all_plans_by_user_id(user_id:, content_choice:)
      if BudgetPlan.where(user_id: user_id).exists?
        case content_choice.to_sym
        when :NEWEST
          # BudgetPlan.where(user_id: id).order(plan_date: :desc)
          [BudgetPlan.where(user_id: user_id).latest_plan]
        when :OLDEST
          [BudgetPlan.where(user_id: user_id).oldest_plan]
        else
          BudgetPlan.where(user_id: user_id).by_plan_date
        end
      else
        Constants::EMPTY_ARRAY
      end
    end

    # ************************************************************************
    #
    # Budget Details
    #
    #
    field :all_details_by_plan_id, [Types::Custom::PlanDetailType], null: true do
      description "Find plans by a user id"
      argument :plan_id, ID, 'Get details based on this plan ID ', required: true
    end

    def all_details_by_plan_id(plan_id:)
      BudgetDetail.includes(:category).where(budget_plan_id: plan_id)
    end

    # ************************************************************************
    #
    # Budget Expenses
    #
    # Find Expenses by plan ID
    field :all_expenses_by_plan_id, [Types::Custom::ExpenseType], null: true do
      description "Find Expenses by a plan id"
      argument :plan_id, ID, 'Get expenses based on this plan ID ', required: true
      argument :amounts_option, Types::Custom::AmountEnum,
        'Option for returning all expenses individually or combined based on category', required: true
    end
    # Find expenses by plan ID
    def all_expenses_by_plan_id(plan_id:, amounts_option:)
      if amounts_option == "COMBINED"
        safe_sql = Expense.send(:sanitize_sql_array, [Expense::SQL_BY_PLAN_ID_SUM_AMOUNTS_BY_CATEGORY, plan_id])
        Expense.find_by_sql(safe_sql)
        # exp = Expense.where(budget_plan_id: plan_id).group(:category_id).sum(:amount)
        # puts " what the hell #{exp}"
        # obj = Expense.joins(:category).where(budget_plan_id: plan_id).group(:category_id).sum(:amount)
        # puts obj.inspect
      else
        Expense.includes(:category).where(budget_plan_id: plan_id)
      end
    end

    # field :user, UserType, null: false do
    #   argument :user_name, String, required: true
    # end

    # def user(user_name:)
    #   User.find_by(user_name: user_name)
    # end
  end
end
