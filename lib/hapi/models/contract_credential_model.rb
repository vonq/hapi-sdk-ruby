# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # ContractCredentialModel Model.
  class ContractCredentialModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :name

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :label

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :sort

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :description

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['name'] = 'name'
      @_hash['label'] = 'label'
      @_hash['sort'] = 'sort'
      @_hash['description'] = 'description'
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

    def initialize(name = nil,
                   label = nil,
                   sort = nil,
                   description = nil,
                   additional_properties = {})
      @name = name unless name == SKIP
      @label = label unless label == SKIP
      @sort = sort unless sort == SKIP
      @description = description unless description == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      name = hash.key?('name') ? hash['name'] : SKIP
      label = hash.key?('label') ? hash['label'] : SKIP
      sort = hash.key?('sort') ? hash['sort'] : SKIP
      description = hash.key?('description') ? hash['description'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      ContractCredentialModel.new(name,
                                  label,
                                  sort,
                                  description,
                                  hash)
    end
  end
end