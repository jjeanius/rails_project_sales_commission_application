require 'pry'

class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)  
    binding.pry
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def index
    @employees = Employee.all
  end
  
  
    def show
      @employee = Employee.find_by(id: params[:id])
    end

    def edit
      @employee = Employee.find_by(id: params[:id])
    end

    def update
      @employee = Employee.find_by(id: params[:id])
        if @employee && @employee.update(employee_params)
          redirect_to @employee
        else
          render :edit_employees_path
        end

    end 
    
    def destroy
      @employee = Employee.find_by(id: params[:id]).destroy
      render :index
    end


private

  def employee_params
    params.require(:employee).permit(:employee, :name, :region, :position, :email, :password, :password_confirmation, :admin)
  end

 

end

