class EmployeesController < ApplicationController
    before_action :this_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            flash[:messages] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def show
    end

    def edit
    end

    def update
        if @employee.update(employee_params)
            redirect_to @employee
        else
            flash[:messages] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee) 
        end
    end 

    def destroy
        @employee.destroy
        redirect_to employees_path
    end


    private
    
    def employee_params
        params.require(:employee).permit(:first_name,
            :last_name,
            :alias,
            :title,
            :office,
            :img_url,
            :dog_id)
    end

    def this_employee
        @employee = Employee.find(params[:id])
    end
end
