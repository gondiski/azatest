require 'rails_helper'

RSpec.describe Transaction, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject {described_class.new(
    input_amount: 100,
    input_currency: "USD",
    output_currency: "KES",
    date_of_transaction: DateTime.now,
    customer_id: 1
  )}
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without an input currency" do
    subject.input_currency = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an input amount" do
    subject.input_amount = nil
    expect(subject).to_not be_valid
  end

  it "is greater than 0" do
    subject.input_currency = -200
    expect(subject).to_not be_valid
  end

  it "is not a valid money value" do 
    subject.input_amount = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an output currency" do
    subject.output_currency = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer id" do
    subject.customer_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a date of transaction" do
    subject.date_of_transaction = nil
    expect(subject).to_not be_valid
  end
end
