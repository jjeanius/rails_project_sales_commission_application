require 'pry'

class SalesController < ApplicationController
  
  def index
    @sale = Sale.new
    @sales = Sale.all
    #binding.pry
  end

  def new
    @sale = Sale.new
  end

  def show
    @sale = Sale.find_by(id: params[:id])
  end
  
  def create
     @sale = Sale.new(sale_params)
       if @sale && @sale.save
          redirect_to @sale
       else
       redirect_to new_sale_path
       end
  end

  def show
    @sale = Sale.find_by(id: params[:id])
  end

  def destroy
    @sale = Sale.find_by(id: params[:id])
    @sale.destroy
    redirect_to sales_path
  end

  

  private
  
  def sale_params
    params.require(:sale).permit(:employee_name, :employee_id, :product_id, :product_name, :quantity, :sales_rate, :sales_amount, :commission_rate, :commission_amount )
  end
end
