require 'swagger_helper'

RSpec.describe 'api/v1/transactions', type: :request do

  path '/api/v1/transactions' do

    get('list transactions') do
      response(200, 'successful') do
        produces 'application/json'
        consumes 'application/json'
        parameter name: :query,
                  in: :query,
                  description: "Optional id to search transaction",
                  required: false

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create transaction') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :transaction, in: :body, schema: {
          type: :object,
          properties: {
            customer_id: {type: :integer},
            input_amount: {type: :number},
            input_currency: {type: :string},
            output_amount: {type: :number},
            output_currency: {type: :string}
          },
          required: %w[customer_id input_amount input_currency output_amount output_currency] 
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/transactions/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show transaction') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update transaction') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update transaction') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :transaction, in: :body, schema: {
          type: :object,
          properties: {
            customer_id: {type: :integer},
            input_amount: {type: :number},
            input_currency: {type: :string},
            output_amount: {type: :number},
            output_currency: {type: :string}
          },
          required: %w[customer_id input_amount input_currency output_amount output_currency] 
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    # delete('delete transaction') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
