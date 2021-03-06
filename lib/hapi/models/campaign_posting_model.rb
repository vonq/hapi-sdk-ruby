# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # CampaignPostingModel Model.
  class CampaignPostingModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # The name of the Product that was bought
    # @return [String]
    attr_accessor :name

    # Number of clicks of the mentioned posting
    # @return [Float]
    attr_accessor :clicks

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['name'] = 'name'
      @_hash['clicks'] = 'clicks'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        name
        clicks
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(name = nil,
                   clicks = nil,
                   additional_properties = {})
      @name = name unless name == SKIP
      @clicks = clicks unless clicks == SKIP

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
      clicks = hash.key?('clicks') ? hash['clicks'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      CampaignPostingModel.new(name,
                               clicks,
                               hash)
    end
  end
end
