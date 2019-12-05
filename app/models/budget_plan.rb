# frozen_string_literal: true

# Budget Plan model
class BudgetPlan < ApplicationRecord
  belongs_to :user
  has_many :budget_details, dependent: :destroy
  has_many :expenses, dependent: :destroy
  scope :by_plan_date, -> { order(plan_date: :desc) }
  scope :latest_plan, -> { by_plan_date.first }
  scope :oldest_plan, -> { by_plan_date.last }

  def self.db_date(date)
    if date.present?
      create_db_date(date)
    else
      fdomd(Date.today)
    end
  end

  def month
    Date::MONTHNAMES[self[:plan_date]&.month]
  end

  def year
    self[:plan_date]&.year
  end

  def self.create_db_date(date)
    # Date.parse('2019-11-20')
    dt = Date.strptime(date, '%Y-%m-%d')
    Date.valid_date?(dt.year, dt.month, dt.day) ? fdomd(dt) : nil
  rescue ArgumentError => _e
    nil
  end

  def self.fdomd(date)
    Date.new(date.year, date.month, 1)
  end
end
