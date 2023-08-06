class FundManagersController < ApplicationController
  def index
    @fund_managers = FundManager.all
  end
  
end
