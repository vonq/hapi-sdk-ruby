# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # WorkingLocationModel Model.
  class WorkingLocationModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :address_line1

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :postcode

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :city

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :country

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['address_line1'] = 'addressLine1'
      @_hash['postcode'] = 'postcode'
      @_hash['city'] = 'city'
      @_hash['country'] = 'country'
      @_hash
    end

    # An array for optional fields
    def optionals
      []
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(address_line1 = nil,
                   postcode = nil,
                   city = nil,
                   country = nil,
                   additional_properties = {})
      @address_line1 = address_line1 unless address_line1 == SKIP
      @postcode = postcode unless postcode == SKIP
      @city = city unless city == SKIP
      @country = country unless country == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      address_line1 = hash.key?('addressLine1') ? hash['addressLine1'] : SKIP
      postcode = hash.key?('postcode') ? hash['postcode'] : SKIP
      city = hash.key?('city') ? hash['city'] : SKIP
      country = hash.key?('country') ? hash['country'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      WorkingLocationModel.new(address_line1,
                               postcode,
                               city,
                               country,
                               hash)
    end
  end
end
