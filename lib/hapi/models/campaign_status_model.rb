# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # CampaignStatusModel Model.
  class CampaignStatusModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :campaign_id

    # Status of the campaign. One of the following
    # @return [StatusEnum]
    attr_accessor :status

    # Status of the campaign. One of the following
    # @return [List of OrderedProductsStatusItemModel]
    attr_accessor :ordered_products_statuses

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['campaign_id'] = 'campaignId'
      @_hash['status'] = 'status'
      @_hash['ordered_products_statuses'] = 'orderedProductsStatuses'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        status
        ordered_products_statuses
      ]
    end

    # An array for nullable fields
    def nullables
      []
    end

    def initialize(campaign_id = nil,
                   status = nil,
                   ordered_products_statuses = nil,
                   additional_properties = {})
      @campaign_id = campaign_id unless campaign_id == SKIP
      @status = status unless status == SKIP
      unless ordered_products_statuses == SKIP
        @ordered_products_statuses =
          ordered_products_statuses
      end

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      campaign_id = hash.key?('campaignId') ? hash['campaignId'] : SKIP
      status = hash.key?('status') ? hash['status'] : SKIP
      # Parameter is an array, so we need to iterate through it
      ordered_products_statuses = nil
      unless hash['orderedProductsStatuses'].nil?
        ordered_products_statuses = []
        hash['orderedProductsStatuses'].each do |structure|
          ordered_products_statuses << (OrderedProductsStatusItemModel.from_hash(structure) if structure)
        end
      end

      ordered_products_statuses = SKIP unless hash.key?('orderedProductsStatuses')

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      CampaignStatusModel.new(campaign_id,
                              status,
                              ordered_products_statuses,
                              hash)
    end
  end
end