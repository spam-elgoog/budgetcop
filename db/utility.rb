# frozen_string_literal: true

# Generates random amounts for expenses and budgets

@category_list =
  [
    [:supplies, 'Office Supplies',
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
     'One time costs and items that just do not fit anywhere else.']
  ]

@category_range =
  {
    expenses:
    {
      ads: 20..50, app: 20..50, refunds: 100..300, damages: 100..300,
      misc: 100..300, transportation: 200..400, permits: 200..400,
      storage: 400..600, default: 20..100
    },
    budgets:
    {
      ads: 75..150, app: 75..150, refunds: 100..300, damages: 100..300,
      misc: 100..300, transportation: 200..400, permits: 200..400,
      storage: 800..1500, default: 20..100
    }
  }

def expense_amount(category)
  e = @category_range[:expenses]
  random_amount e.key?(category) ? e[category] : e[:default]
end

def budget_amount(category)
  b = @category_range[:budgets]
  random_amount b.key?(category) ? b[category] : b[:default]
end

def random_amount(range)
  (rand(range) * 1.01).round 2
end
