class MessManagersController < ApplicationController
  def index
    @mess_managers = MessManager.all
  end

  def new
    @mess_manager = MessManager.new
  end

  def create
    @mess_manager = MessManager.new(mess_manager_params)
    if @mess_manager.save
      flash[:success] = "mess_manager successfully created"
      redirect_to mess_managers_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def mess_manager_params
    params.require(:mess_manager).permit(:student_id, :for_which_month,:assign_by, :total_marketing_expenses, :total_grocery_expenses, :total_miscellaneous_expenses, :total_collection_of_guest_meal, :grant_total_of_expenses, :per_head_expenses, :wallet_balance, :mess_manager_type,:remarks)
  end
  
  
end
