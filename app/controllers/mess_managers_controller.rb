class MessManagersController < ApplicationController
  def index
    @mess_managers = MessManager.all
  end
  
end
