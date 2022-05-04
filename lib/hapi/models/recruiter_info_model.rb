# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # Recruiter is the user creating the campaign and you may want to use this to
  # provide filtering by recruiter for groups sharing an account.
  class RecruiterInfoModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # A vendor-related unique identification for the Recruiter
    # @return [String]
    attr_accessor :id

    # A vendor-related unique identification for the Recruiter
    # @return [String]
    attr_accessor :name

    # A vendor-related unique identification for the Recruiter
    # @return [String]
    attr_accessor :email_address

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['id'] = 'id'
      @_hash['name'] = 'name'
      @_hash['email_address'] = 'emailAddress'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        id
        email_address
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(name = nil,
                   id = nil,
                   email_address = nil,
                   additional_properties = {})
      @id = id unless id == SKIP
      @name = name unless name == SKIP
      @email_address = email_address unless email_address == SKIP

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
      id = hash.key?('id') ? hash['id'] : SKIP
      email_address = hash.key?('emailAddress') ? hash['emailAddress'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      RecruiterInfoModel.new(name,
                             id,
                             email_address,
                             hash)
    end
  end
end