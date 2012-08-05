class ProductsController < ApplicationController
  before_filter :login_required
  
  def index
    @products = storenvy_products(current_user)
    @store    = storenvy_store_info(current_user)
  end

  def show
  end
  
  def new
    
  end
end
