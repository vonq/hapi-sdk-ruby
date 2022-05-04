# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # ListChannelsResponseModel Model.
  class ListChannelsResponseModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [Integer]
    attr_accessor :count

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :mnext

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :previous

    # TODO: Write general description for this method
    # @return [List of ChannelLiteModel]
    attr_accessor :results

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['count'] = 'count'
      @_hash['mnext'] = 'next'
      @_hash['previous'] = 'previous'
      @_hash['results'] = 'results'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        mnext
        previous
      ]
    end

    # An array for nullable fields
    def nullables
      %w[
        mnext
        previous
      ]
    end

    def initialize(count = nil,
                   results = nil,
                   mnext = nil,
                   previous = nil,
                   additional_properties = {})
      @count = count unless count == SKIP
      @mnext = mnext unless mnext == SKIP
      @previous = previous unless previous == SKIP
      @results = results unless results == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      count = hash.key?('count') ? hash['count'] : SKIP
      # Parameter is an array, so we need to iterate through it
      results = nil
      unless hash['results'].nil?
        results = []
        hash['results'].each do |structure|
          results << (ChannelLiteModel.from_hash(structure) if structure)
        end
      end

      results = SKIP unless hash.key?('results')
      mnext = hash.key?('next') ? hash['next'] : SKIP
      previous = hash.key?('previous') ? hash['previous'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      ListChannelsResponseModel.new(count,
                                    results,
                                    mnext,
                                    previous,
                                    hash)
    end
  end
end