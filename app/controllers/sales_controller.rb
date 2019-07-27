require 'pry'

class SalesController < ApplicationController
  
  def index
    @salez = Sales.all
    if params[:employee_id]   #  if sales has employee id
       @sales = Employee.find(params[:employee_id]).salez    # want to access all sales by that employee       
    else
       @salez = Sales.all
    end
  end

  def new
    @sales = Sales.new
      @sales = Sales.new(employee_id: params[:employee_id], product_id: params[:product_id])     #  capture employee_id and product id through nested route   
  end  
    
  def create    
    @sales = Sales.new(sales_params)  #  update the sales_params to accept employee_id
      if@sales && @sales.save
        redirect_to sales_path
      else
        redirect_to new_sale_path
    end 
  end

  def show
    set_sales 
  end  

  def update
    set_sales   
    
     if @sales && @sales.update(sales_params)
     
       redirect_to @sales
    else
      render :edit
    end
  end

  def edit
    set_sales    
  end
    
  def destroy
    set_sales
      @sales.destroy
        redirect_to sales_path
  end

  

  private

  def set_sales
    @sales = Sales.find_by(id: params[:id])
  end
  
  def sales_params
    params.require(:sales).permit(:employee_id, :product_id, :product_name, :quantity, :sales_rate, :commission_rate, :commission_amount)
  end
  
end