# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # Used for Facets whose value choices need to be fetched through an additional
  # call to the [List autocomplete values for posting
  # requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-autoc
  # omplete-values-for-posting-requirement) endpoint.
  class AutocompleteModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # List of keys to pass to  the body of the request calling the [List
    # autocomplete values for posting
    # requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-aut
    # ocomplete-values-for-posting-requirement) endpoint.
    # @return [List of RequiredParameterEnum]
    attr_accessor :required_parameters

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['required_parameters'] = 'required_parameters'
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

    def initialize(required_parameters = nil,
                   additional_properties = {})
      @required_parameters = required_parameters unless required_parameters == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      required_parameters =
        hash.key?('required_parameters') ? hash['required_parameters'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      AutocompleteModel.new(required_parameters,
                            hash)
    end
  end
end
