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
    @transfer = TransferFunds.create(transfer_params, current_user)

    if @transfer.save
      redirect_to transfer_path(id: @transfer.id), success: "Your transfer of #{@transfer.amount} dollars was successful."
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
