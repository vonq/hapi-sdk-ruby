# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # CheckCampaignStatusresponseModel Model.
  class CheckCampaignStatusresponseModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [CampaignStatusModel]
    attr_accessor :data

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['data'] = 'data'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        data
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(data = nil,
                   additional_properties = {})
      @data = data unless data == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      data = CampaignStatusModel.from_hash(hash['data']) if hash['data']

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      CheckCampaignStatusresponseModel.new(data,
                                           hash)
    end
  end
end
