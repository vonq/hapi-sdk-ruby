# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

require 'date'
module Hapi
  # CreateContractResponseModel Model.
  class CreateContractResponseModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :customer_id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :contract_id

    # TODO: Write general description for this method
    # @return [Integer]
    attr_accessor :channel_id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :credentials

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :class_name

    # TODO: Write general description for this method
    # @return [Object]
    attr_accessor :facets

    # TODO: Write general description for this method
    # @return [ProductLiteModel]
    attr_accessor :product

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :posting_requirements

    # TODO: Write general description for this method
    # @return [DateTime]
    attr_accessor :expiry_date

    # TODO: Write general description for this method
    # @return [Integer]
    attr_accessor :credits

    # TODO: Write general description for this method
    # @return [PurchasePriceModel]
    attr_accessor :purchase_price

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['customer_id'] = 'customer_id'
      @_hash['contract_id'] = 'contract_id'
      @_hash['channel_id'] = 'channel_id'
      @_hash['credentials'] = 'credentials'
      @_hash['class_name'] = 'class_name'
      @_hash['facets'] = 'facets'
      @_hash['product'] = 'product'
      @_hash['posting_requirements'] = 'posting_requirements'
      @_hash['expiry_date'] = 'expiry_date'
      @_hash['credits'] = 'credits'
      @_hash['purchase_price'] = 'purchase_price'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        expiry_date
        credits
        purchase_price
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(customer_id = nil,
                   contract_id = nil,
                   channel_id = nil,
                   credentials = nil,
                   class_name = nil,
                   facets = nil,
                   product = nil,
                   posting_requirements = nil,
                   expiry_date = nil,
                   credits = nil,
                   purchase_price = nil,
                   additional_properties = {})
      @customer_id = customer_id unless customer_id == SKIP
      @contract_id = contract_id unless contract_id == SKIP
      @channel_id = channel_id unless channel_id == SKIP
      @credentials = credentials unless credentials == SKIP
      @class_name = class_name unless class_name == SKIP
      @facets = facets unless facets == SKIP
      @product = product unless product == SKIP
      @posting_requirements = posting_requirements unless posting_requirements == SKIP
      @expiry_date = expiry_date unless expiry_date == SKIP
      @credits = credits unless credits == SKIP
      @purchase_price = purchase_price unless purchase_price == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      customer_id = hash.key?('customer_id') ? hash['customer_id'] : SKIP
      contract_id = hash.key?('contract_id') ? hash['contract_id'] : SKIP
      channel_id = hash.key?('channel_id') ? hash['channel_id'] : SKIP
      credentials = hash.key?('credentials') ? hash['credentials'] : SKIP
      class_name = hash.key?('class_name') ? hash['class_name'] : SKIP
      facets = hash.key?('facets') ? hash['facets'] : SKIP
      product = ProductLiteModel.from_hash(hash['product']) if hash['product']
      posting_requirements =
        hash.key?('posting_requirements') ? hash['posting_requirements'] : SKIP
      expiry_date = if hash.key?('expiry_date')
                      (DateTimeHelper.from_rfc3339(hash['expiry_date']) if hash['expiry_date'])
                    else
                      SKIP
                    end
      credits = hash.key?('credits') ? hash['credits'] : SKIP
      purchase_price = PurchasePriceModel.from_hash(hash['purchase_price']) if
        hash['purchase_price']

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      CreateContractResponseModel.new(customer_id,
                                      contract_id,
                                      channel_id,
                                      credentials,
                                      class_name,
                                      facets,
                                      product,
                                      posting_requirements,
                                      expiry_date,
                                      credits,
                                      purchase_price,
                                      hash)
    end

    def to_expiry_date
      DateTimeHelper.to_rfc3339(expiry_date)
    end
  end
end
