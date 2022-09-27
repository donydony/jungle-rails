class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin_products[:user_name], password: Rails.configuration.admin_products[:password]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(Category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def Category_params
    params.require(:category).permit(
      :name
    )
  end
end