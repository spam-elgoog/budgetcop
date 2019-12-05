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
      argument :id, ID, 'Get plans based on this ID ', required: true
      argument :content_choice, Types::Custom::ContentChoiceType, required: true
    end

    # this method is invoked, when `all_users` fields is being resolved
    def all_plans_by_user_id(id:, content_choice:)
      case content_choice.to_sym
      when :NEWEST
        # BudgetPlan.where(user_id: id).order(plan_date: :desc)
        [BudgetPlan.where(user_id: id).latest_plan]
      when :OLDEST
        [BudgetPlan.where(user_id: id).oldest_plan]
      else
        BudgetPlan.where(user_id: id).by_plan_date
      end
    end

    # ************************************************************************
    #
    # Budget Details
    #
    #
    field :all_details_by_plan_id, [Types::Custom::PlanDetailType], null: true do
      description "Find plans by a user id"
      argument :id, ID, 'Get details based on this plan ID ', required: true
    end

    def all_details_by_plan_id(id:)
      detail = BudgetDetail.joins(:category)
        .where(budget_plan_id: id)
        .pluck(:budget_plan_id, :id, :amount, :category_id, :category, :short_desc)

      HashMapper.new(detail).map_to_keys(%i[budget_plan_id id amount category_id category short_desc])

      # This can be used instead of HashMapper
      # detail = BudgetDetail.joins(:category)
      # .where(budget_plan_id: id)
      # .select(:budget_plan_id, :id, :amount, :category_id, :category, :short_desc)
      # detail.map do |item|
      #   {
      #     budget_plan_id: item.budget_plan_id,
      #     id: item.id,
      #     amount: item.amount,
      #     category_id: item.category_id,
      #     short_desc: item.short_desc,
      #     category: item.category&.category
      #   }
      # end
    end

    # ************************************************************************
    #
    # Budget Expenses
    #
    # Find Expenses by plan ID
    field :all_expenses_by_plan_id, [Types::Custom::ExpenseType], null: true do
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
