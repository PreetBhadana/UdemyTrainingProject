class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home departments]
  def home
    @employees = Employee.all.includes(:department)
  end

  def new_employee
    @employee = Employee.new
  end

  def create_employee
    @employee = Employee.new(employee_create_params)
    if @employee.save
      redirect_to root_path, notice: "You created a employee !!"
    else
      render :new_employee, alert: "Your employee wasn't created !!"
    end
  end

  def about
    @user = current_user
  end

  def show_employee
    @employee = Employee.find_by(id: params['id'])
    @department = @employee['department_id'] != nil ? Department.find_by(id: @employee['department_id']) : 'NA'
    debugger
  end

  def destroy_employee
    @emp = Employee.find_by(id: params['id'])
    @emp.destroy
    @chk = Employee.find_by(id: params['id'])
    if(!@chk.present?)
      redirect_to root_path, alert: "You deleted a employee !!"
    end
  end

  def edit_employee
    @employee = Employee.find_by(id: params['id'])
  end

  def update_employee
    @employee = Employee.find_by(id: params['id'])
    data = employee_params
    @employee.update(name: data['name'], age: data['age'], department_id: data['department_id'])
    if @employee.save
      redirect_to "/employees/#{params['id']}", notice: "You Updated a employee !!"
    else
      render :edit_employee, alert: "Your employee wasn't Updated !!"
    end
  end

  def departments
    @departments = Department.all
  end

  def new_department
    @department = Department.new
  end

  def create_department
    @department = Department.new(department_params)
    if @department.save
      redirect_to '/departments', notice: "You created a department !!"
    else
      render :new_department, alert: "Your department wasn't created !!"
    end
  end

  def show_department
    @department = Department.find_by(id: params['id'])
  end

  def edit_department
    @department = Department.find_by(id: params['id'])
  end

  def update_department
    @department = Department.find_by(id: params['id'])
    data = department_params
    @department.update(name: data['name'])
    if @department.save
      redirect_to "/departments/#{params['id']}", notice: "You Updated a employee !!"
    else
      render :edit_department, alert: "Your employee wasn't Updated !!"
    end
  end

  def destroy_department
    @dept = Department.find_by(id: params['id'])
    @dept.destroy
    @chk = Department.find_by(id: params['id'])
    if(!@chk.present?)
      redirect_to '/departments', alert: "You deleted a department !!"
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :age, :department_id)
  end

  def employee_create_params
    params.require(:employee).permit(:name, :age, :department_id, :image, pictures: [])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
