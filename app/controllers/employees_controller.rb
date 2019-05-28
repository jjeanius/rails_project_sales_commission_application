require 'pry'

class EmployeesController < ApplicationController

  
  def index
    @employees = Employee.all
  end
    
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)  
      if @employee.save
        session[:employee_id] = @employee.id
        
        redirect_to employee_path(@employee)
      else
        render :new
      end
  end
   
  def show
    set_employee
      @salez = Sales.all
      # @sales = Sales.find_by(id: params[:sales_id])
  end

  def edit
    set_employee
  end

  def update
    set_employee
      if @employee && @employee.update(employee_params)
        redirect_to @employee
      else
        render :edit_employees_path
    end
  end 
    
  def destroy
          set_employee.delete
      #session[employee_id].delete
      redirect_to root_path
  end


private

  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
    params.require(:employee).permit(:employee, :name, :region, :position, :email, :password, :password_confirmation, :admin)
  end

 

end

