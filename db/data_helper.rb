# frozen_string_literal: true

require_relative 'utility'

def populate_categories
  @category_list.each do |x|
    Category.create(
      category: x[0].to_s,
      short_desc: x[1],
      full_desc: x[2]
    )
  end
  puts '>>> INFO: Categories table populated.'
end

def populate_users
  User.create(f_name: 'Mike', l_name: 'Sanders', email: 'mike@gm.com',
              user_name: 'mikesanders', admin: false,
              password: 'password', password_confirmation: 'password')
  User.create(f_name: 'Sam', l_name: 'Hinds', email: 'sam@gm.com',
              user_name: 'samhinds', admin: false, password: 'password',
              password_confirmation: 'password')
  User.create(f_name: 'Anita', l_name: 'Wong', email: 'anita@gm.com',
              user_name: 'anitawong', admin: false, password: 'password',
              password_confirmation: 'password')
  User.create(f_name: 'John', l_name: 'Good', email: 'john@gm.com',
              user_name: 'johngood', admin: false, password: 'password',
              password_confirmation: 'password')
  User.create(f_name: 'Indira', l_name: 'Ghandi', email: 'indira@gm.com',
              user_name: 'indiraghandi', admin: false,
              password: 'password',
              password_confirmation: 'password')
  User.create(f_name: 'Peter', l_name: 'Spam', email: 'spam@gm.com',
              user_name: 'peterspam', admin: true,
              password: 'tophat.made',
              password_confirmation: 'tophat.made')
  User.create(f_name: 'Jana', l_name: 'Fling', email: 'jana@gm.com',
              user_name: 'janafling', admin: false, password: 'password',
              password_confirmation: 'password')
  puts '>>> INFO: Users table populated.'
end

def populate_plans
  users = User.all
  # leave last 3 records with no Budget Plans to start so there are users
  # with no budgets available.
  users[0..(users.length - 4)].each do |x|
    # initialize a November budget
    x.budget_plans.create(plan_date: Date.new(2019, 11, 1))
    # every second user initialize an October budget also
    x.budget_plans.create(plan_date: Date.new(2019, 10, 1)) if x.id.even?
  end
  puts '>>> INFO: Budget_Plans table populated.'
end

def populate_details(plans)
  plans.each do |plan|
    add_budget_details plan
  end
  puts '>>> INFO: Budget_Details table populated.'
end

def populate_expenses(plans)
  plans.each do |p|
    # add one or two sets, modify as required
    add_budget_expenses p, p.id.even? ? 2 : 1
  end
  puts '>>> INFO: Expenses table populated.'
end

private

# Recursive function
# Num is the number of expense sets you want stimulate in your budget plan.
# each set will have as many expenses as there are current categories
# if 12 categories in the DB categories table then this will generate at
# minimum one set
def add_budget_expenses(plan, num)
  Category.all.each do |cat|
    plan.expenses.create(category_id: cat.id,
                         details: cat.category,
                         amount: expense_amount(cat.category.to_sym))
  end
  add_budget_expenses(plan, num - 1) if (num - 1).positive?
end

# Add details
def add_budget_details(plan)
  Category.all.each do |cat|
    plan.budget_details.create(category_id: cat.id,
                               amount: budget_amount(cat.category.to_sym))
  end
end
