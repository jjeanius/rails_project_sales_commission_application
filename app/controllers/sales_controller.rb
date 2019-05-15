require 'pry'

class SalesController < ApplicationController
  
  def index
        @sales = Sales.all
  end
  
  def new
    @sale = Sales.new
  end

  def create
    @sale = Sales.new(sale_params)   
    binding.pry
      if @sale && @sale.save
        render :show
      else
        redirect_to new_sale_path
      end
  end

  def show
    @sale = Sales.find_by(id: params[:id])
    
  end

  def destroy
    @sale = Sales.find_by(id: params[:id])
    @sale.destroy
    redirect_to sales_path
  end

  

  private
  
  def sale_params
    params.require(:sale).permit(:employee_id, :product_id, :product_name, :quantity, :sales_rate, :sales_amount, :commission_rate, :commission_amount )
  end
end
