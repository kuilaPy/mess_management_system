class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end
  
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Object.new(params[:transaction])
    if @transaction.save
      flash[:success] = "Object successfully created"
      redirect_to @transaction
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Object.find(params[:id])
      if @transaction.update_attributes(params[:transaction])
        flash[:success] = "Object was successfully updated"
        redirect_to @transaction
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
    @transaction = Object.find(params[:id])
    if @transaction.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to transactions_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to transactions_url
    end
  end
  
  
  
end
