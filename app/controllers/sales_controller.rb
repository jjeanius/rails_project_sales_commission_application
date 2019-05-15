require 'pry'

class SalesController < ApplicationController
  
  def index
        @salez = Sales.all
  end
  
  def new
    @sales = Sales.new
    render :new
  end

  def create
    @sales = Sales.new(sales_params) 
      @sales.save
        render :show
     # else
     #  redirect_to new_sale_path
    #  end
  end

  def show
    @sales = Sales.find_by(id: params[:id])
   
  end

  def edit
    @sales = Sales.find_by(id: params[:id])
  end

  def update
    @sales = Sales.find_by(id: params[:id])
    if @sales && @sales.update(sales_params)
      format.html { redirect_to @sales, notice: 'Sales was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
      

  def destroy
   session[:employee_id] = nil
     redirect_to root_path
  end

  

  private
  
  def sales_params
    params.require(:sales).permit(:employee_id, :product_id, :product_name, :quantity, :sales_rate, :commission_rate, :commission_amount)
  end
end
