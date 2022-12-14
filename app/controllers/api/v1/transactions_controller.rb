class Api::V1::TransactionsController < ApplicationController
  require 'services/fx'
  before_action :set_transaction, only: [:show, :update, :destroy]
  def index
    transactions = Transaction.all
    render json: transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.date_of_transaction = DateTime.now
    conversion = Services::Fx.convert(transaction.input_currency,transaction.output_currency,transaction.input_amount)
    puts "Conversion is #{conversion}"
    transaction.output_amount = conversion
    if transaction.save
      render status: :ok, json: transaction
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      conversion = Services::Fx.convert(@transaction.input_currency,@transaction.output_currency,@transaction.input_amount)
      @transaction.output_amount = conversion
      render status: :ok, json: @transaction
    else
      render json: @tranaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :date_of_transaction)
  end
 
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
