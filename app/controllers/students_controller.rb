class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "student successfully created"
      redirect_to students_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  private

  def student_params
    params.require(:student).permit(:email, :password,:name, :date_of_birth, :phone_no, :address, :department, :admission_year, :passout_year, :job_which_company, :is_current_borders,:is_admin,:is_admin,:is_admin,:is_admin,:reset_password_token,:reset_password_sent_at,:remember_created_at,:sign_in_count,:last_sign_in_at,:failed_attempts,:unlock_token,:locked_at)
  end
end
