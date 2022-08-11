class Api::V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    render json: transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction
  end

  def new
    transaction = Transaction.new
    render json: transaction
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.save!
    render status: :ok, json: { notice: "Transaction successfully made!" }
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :date_of_transaction)
  end
end
