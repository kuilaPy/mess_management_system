class TxnsController < ApplicationController
  before_action :set_defaut_date
  def index
    @txns = Txn.all
    @txns = Txn.where.not(txn_type: [Txn::TXN_TYPE.key("Fund Wallet Credit +C.F.W"),Txn::TXN_TYPE.key("Fund wallet Debit -D.F.W")])
    @txns = Txn.where(txn_type: params[:txn_type]) if params[:txn_type].present?

  end
  
  def new
    @txn = Txn.new
  end

  def create
    @txn = Txn.new(txn_params)
    if @txn.save
      flash[:success] = "Object successfully created"
      redirect_to txns_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @txn = Txn.find(params[:id])
  end

  def update
    @txn = Object.find(params[:id])
      if @txn.update_attributes(txn_params)
        flash[:success] = "Object was successfully updated"
        redirect_to txns_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
    @txn = Object.find(params[:id])
    if @txn.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to txns_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to txns_url
    end
  end
  
  private
  def set_defaut_date
    @current_mess_manager = MessManager.active
    # @current_fund_manager = FundManager.active
  end
  
  def txn_params
    params.require(:txn).permit(:date, :student_id, :amount, :comment,:txn_type,:wallet_type,:mess_manager_id,:fund_manager_id,:net_amount)
  end

end
