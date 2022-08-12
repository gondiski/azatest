class TransactionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :date_of_transaction
end
