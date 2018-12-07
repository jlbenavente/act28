class EmployeesController < ApplicationController


	def create
		@employee = Employee.new(employee_params)
		@employee.company_id = params[:company_id]

		respond_to do |format|
      if @employee.save!
        format.html { redirect_to company_employee_path(@employee.company_id, @employee.id), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @employees.errors, status: :unprocessable_entity }
      end
		end
  end

  def show
  	@employee = Employee.find(params[:id])
  end


	private
	def employee_params
		params.require(:employee).permit(:first_name, :last_name, :email, :area_id, :company_id)
	end

end
