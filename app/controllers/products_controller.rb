require 'pry'

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product && @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end 
    
  def edit
    @product =  Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end
  

  def destroy
    Product.find(params[:id]).destroy
      redirect_to products_path
     
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
   end

   
end
