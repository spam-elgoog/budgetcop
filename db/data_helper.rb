@category_list =
  [[:supplies, 'Office Supplies',
    'Buiness related supplies, stationary etc.'],
   [:shipping, 'Shipping Expenses',
    'Track your monthly shipping costs.'],
   [:transportation, 'Transportation',
    'Transportation related costs, fuel, insurance.'],
   [:storage, 'Product Storage',
    'Warehousing costs, temporary storage and so on'],
   [:website, 'Website Expenses',
    'Website management, hosting and platform fees.'],
   [:permits, 'Permits and Licensing',
    'Business licensing, health inspection certifications if making food.'],
   [:utils, 'Utilities',
    'Monthly cable and internet and similar costs.'],
   [:ads, 'Marketing and Advertising',
    'Marketing campaigns or ads you ran.'],
   [:apps, 'App Subscriptions',
    'All your subscription whether apps or software.'],
   [:refunds, 'Returns and Refunds',
    'Returned items and/or refunds you have issued.'],
   [:damages, 'Damaged Goods',
    'Track damaged and lost items.'],
   [:misc, 'All Other Expenses',
    'One time costs and items that just do not fit anywhere else.']]

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

def random_amount(range)
  rand(range) * 1.01
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
    if x.id.even?
      x.budget_plans.create(plan_date: Date.new(2019, 10, 1))
    end
  end
  puts '>>> INFO: Budget_Plans table populated.'
end

def populate_details(plans)
  plans.transaction do
    plans.each do |plan|
      add_budget_details plan
    end
  end
  puts '>>> INFO: Budget_Details table populated.'
end

def populate_expenses(plans)
  plans.transaction do
    plans.each do |p|
      # add one set
      add_budget_expenses p, p.id.even? ? 2 : 1
    end
  end
  puts '>>> INFO: Expenses table populated.'
end

# Recursive function
# Num is the number of expense sets you want stimulate in your budget plan.
# each set will have as many expenses as there are current categories
# if 12 categories in the DB categories table then this will generate at
# minimum one set
def add_budget_expenses(plan, num)
  cats = Category.all
  num = num.abs
  cats.each do |cat|
    # Get random amount for eacch category
    amount =  case cat.category.to_sym
              when :ads, :apps then random_amount 20..50
              when :refunds, :damages, :misc then random_amount 5..50
              when :transportation, :permits then random_amount 50..100
              when :storage then random_amount 400..600
              # supplies, refunds, utils, website and anything I missed
              else random_amount 5..80
              end
    plan.expenses.create(category_id: cat.id,
                         details: cat.category,
                         amount: amount)
  end
  add_budget_expenses plan, num - 1 if (num - 1).positive?
end

def add_budget_details(plan)
  cats = Category.all
  cats.each do |cat|
    # Get random amount for each category
    amount =  case cat.category.to_sym
              when :ads, :apps then random_amount 75..150
              when :refunds, :damages, :misc then random_amount 100..300
              when :transportation, :permits then random_amount 200..400
              when :storage then random_amount 800..1500
              # supplies, refunds, utils, website and anything I missed
              else random_amount 50..200
              end
    plan.budget_details.create(category_id: cat.id, amount: amount)
  end
end
