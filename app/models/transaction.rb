class Transaction < ApplicationRecord
    validates_presence_of :input_amount
    validates_presence_of :input_currency
    validates_presence_of :output_currency
    validates_presence_of :customer_id
    validates_presence_of :date_of_transaction
end
