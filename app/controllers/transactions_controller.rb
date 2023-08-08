class TransactionsController < ApplicationController
  before_action :set_defaut_date
  def index
    @transactions = Transaction.all
    @transactions = Transaction.where.not(txn_type: [Transaction::TXN_TYPE.key("Fund Wallet Credit +C.F.W"),Transaction::TXN_TYPE.key("Fund wallet Debit -D.F.W")])
    @transactions = Transaction.where(txn_type: params[:txn_type]) if params[:txn_type].present?

  end
  
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = "Object successfully created"
      redirect_to transactions_path
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
      if @transaction.update_attributes(transaction_params)
        flash[:success] = "Object was successfully updated"
        redirect_to transactions_path
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
  
  private
  def set_defaut_date
    @current_mess_manager = MessManager.active
    # @current_fund_manager = FundManager.active
  end
  
  def transaction_params
    params.require(:transaction).permit(:date, :student_id, :amount, :comment,:txn_type,:wallet_type,:mess_manager_id,:fund_manager_id,:net_amount)
  end

  
end
