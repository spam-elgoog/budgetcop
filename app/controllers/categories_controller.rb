# frozen_string_literal: true

# Categories controller.
# TODO: create a constant for these values for now until we decide to 
# if we should provide functionality to add categories via admin
# Atm its unnecessary to get data from db.
class CategoriesController < ApplicationController
  def index
    @cats = Category.all
    # @cats = Category.all.order(short_desc: :asc)
  end

  def catjson
    @cats = Category.all
    # redirect_to categories_path
    render 'index'
    # render json: @cats.as_json(only: %i[id category short_desc full_desc])
  end
end
