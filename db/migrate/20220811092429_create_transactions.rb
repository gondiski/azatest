class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.bigint :customer_id
      t.decimal :input_amount
      t.string :input_currency
      t.decimal :output_amount
      t.string :output_currency
      t.datetime :date_of_transaction

      t.timestamps
    end
  end
end
