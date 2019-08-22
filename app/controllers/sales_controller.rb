require 'pry'

class SalesController < ApplicationController

  def index
    @sales = Sale.all
    if params[:employee_id]   #  if sales has employee id
       @sales = Employee.find(params[:employee_id]).sales  # want to access all sales by that employee
    else
       @sales = Sale.all
    end
  end

  def new
    @sale = Sale.new
      @sale = Sale.new(employee_id: params[:employee_id], product_id: params[:product_id])     #  capture employee_id and product id through nested route
  end

  def create
    @sale = Sale.new(sale_params) #  update the sales_params to accept employee_id
      if @sale.save
        redirect_to @sale
      else
        render :new
    end
  end

  def show
    if set_sale
      render :show
    else
      redirect_to '/'

    end
  end

  def update
    set_sale
      if @sale.update(sale_params)
        redirect_to @sale
      else
        render :edit
      end
  end

  def edit
    set_sale
  end

  def destroy
    set_sale
      @sale.destroy
    redirect_to sales_path
  end



  private

  def set_sale
    @sale = Sale.find_by(id: params[:id])
  end

  def sale_params
    params.require(:sale).permit(:employee_id, :product_id, :product_name, :quantity, :sales_rate, :commission_rate, :commission_amount)
  end

end