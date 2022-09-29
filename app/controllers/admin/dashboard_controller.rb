class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin_products[:user_name], password: Rails.configuration.admin_products[:password]
  def show
    @products = Product.all
    @categories = Category.all
  end
end
