class ApplicationController < ActionController::Base
  before_action :authenticate_student!

  def set_timerange
    if params[:from_date].present? && params[:to_date].present?
      @from_datetime = params[:from_date].to_date.beginning_of_day
      @to_datetime = params[:to_date].to_date.end_of_day
    elsif params[:from_date].present?
      @from_datetime = params[:from_date].to_date.beginning_of_day
      @to_datetime = @from_datetime.end_of_day
    else
      @from_datetime = Date.today.beginning_of_day
      @to_datetime = Date.today.end_of_day
    end
    @from_date = @from_datetime.to_date
    @to_date = @to_datetime.to_date
  end

  def after_sign_in_path_for(resource)
    if current_student.sign_in_count == 1
      pw_change_students_path
    else
      authenticated_root_path
    end
  end
end
