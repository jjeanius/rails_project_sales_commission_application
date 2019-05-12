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
    @product = Product.find_by(id: params[:Id])
  end

  def update
    @product = Product.find_by(id: params[:id])
      if @product && @product.update
        redirect_to product_path(@product)
      else
        render :edit
      end
    end

    def destroy
     @product = Product.find_by(id: params[:id])
      @product.destroy
      render :index
    end

  private

  def product_params
    params.require(:product).permit(:name, :description)
   end

   # <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"H7JElQJCEdV7WSd96478IATggva0e1jbAtwFjPuvVkVRdX+nyPnaaSrCFPVsH9sKuYBU6ZMmd/6srSwj5EOitg==", "product"=><ActionController::Parameters {"name"=>"529 Educational Plan", "description"=>"Children Educational Saving Plan"} permitted: false>, "commit"=>"Submit", "controller"=>"products", "action"=>"create"} permitted: false>
end
