# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # OrderedProductsStatusItemModel Model.
  class OrderedProductsStatusItemModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :product_id

    # Status of the product. One of the following
    # @return [ChannelStatusEnum]
    attr_accessor :status

    # Additional information about product status
    # @return [String]
    attr_accessor :status_description

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['product_id'] = 'productId'
      @_hash['status'] = 'status'
      @_hash['status_description'] = 'statusDescription'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        product_id
        status
        status_description
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(product_id = nil,
                   status = nil,
                   status_description = nil,
                   additional_properties = {})
      @product_id = product_id unless product_id == SKIP
      @status = status unless status == SKIP
      @status_description = status_description unless status_description == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      product_id = hash.key?('productId') ? hash['productId'] : SKIP
      status = hash.key?('status') ? hash['status'] : SKIP
      status_description =
        hash.key?('statusDescription') ? hash['statusDescription'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      OrderedProductsStatusItemModel.new(product_id,
                                         status,
                                         status_description,
                                         hash)
    end
  end
end