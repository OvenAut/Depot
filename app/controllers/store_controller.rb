class StoreController < ApplicationController
  def index
    session[:counter] ||= 0
    session[:counter] += 1 
    @products = Product.all
    
      
  end

end
