# frozen_string_literal: true
class CategoriesController < ApplicationController
  # TODO: create a constant for these values for now until we decide to
  # if we should provide functionality to add categories via admin
  # Atm its unnecessary to get data from db.
  def index
    @cats = Category.all
    # @cats = Category.all.order(short_desc: :asc)
    respond_to do |format|
      format.html
      # as_json or to_json??
      format.json { render(json: @cats.as_json(only: %i[id category short_desc full_desc])) }
    end
  end
end
