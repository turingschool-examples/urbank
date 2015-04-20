class TransfersController < ApplicationController
  def index
    @transfers = current_user.transfers
  end

  def show
    @transfer = current_user.account.outgoing_transfers.find_by(id: params[:id])
  end

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.create(transfer_params)
    account   = current_user.account

    if @transfer.save && account.amount >= @transfer.amount
      account.amount = (account.amount - @transfer.amount)
      account.save
      redirect_to transfer_path(@transfer), success: "Your transfer of #{@transfer.amount} dollars was successful."
    else
      flash.now[:warning] = 'Your transfer could not be completed. Please, try again.'
      render :new
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:amount, :incoming_id, :outgoing_id)
  end
end
