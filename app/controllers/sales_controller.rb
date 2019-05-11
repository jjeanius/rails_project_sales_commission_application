class SalesController < ApplicationController

  def index
    @saless = Sales.all
    render :index
  end

  def show
    @sales = Sales.find_by(id: params[:id])
  end

  def new
    @sales = Sales.new
  end
  
  def create
     @sales = Sales.new(sales_params)
       if @sales && @sales.save
          redirect_to @sales
       else
       redirect_to new_sale_path
       end
  end

  def show
    @sales = Sales.find_by(id: params[:id])
  end

  def destroy
    @sales = Sales.find_by(id: params[:id])
    @sales.destroy
    redirect_to sales_path
  end

  

  private
  
  def sales_params
    params.require(:sales).permit(:employee_name, :employee_id, :product_id, :product_name, :quantity, :sales_rate, :sales_amount, :commission_rate, :commission_amount )
  end
end
