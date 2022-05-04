# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # PostingWeeklyWorkingHoursModel Model.
  class PostingWeeklyWorkingHoursModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [Float]
    attr_accessor :from

    # This value needs to be an positive integer
    # @return [Float]
    attr_accessor :to

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['from'] = 'from'
      @_hash['to'] = 'to'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        from
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(to = nil,
                   from = nil,
                   additional_properties = {})
      @from = from unless from == SKIP
      @to = to unless to == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      to = hash.key?('to') ? hash['to'] : SKIP
      from = hash.key?('from') ? hash['from'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      PostingWeeklyWorkingHoursModel.new(to,
                                         from,
                                         hash)
    end
  end
end
