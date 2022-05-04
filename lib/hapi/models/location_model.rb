# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # Location(id, canonical_name, desq_name_en, desq_country_code, country_code,
  # mapbox_id, mapbox_text, mapbox_placename, mapbox_context, mapbox_place_type,
  # mapbox_shortcode, mapbox_within)
  class LocationModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [Float]
    attr_accessor :id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :fully_qualified_place_name

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :canonical_name

    # TODO: Write general description for this method
    # @return [List of Float]
    attr_accessor :bounding_box

    # TODO: Write general description for this method
    # @return [Float]
    attr_accessor :area

    # TODO: Write general description for this method
    # @return [PlaceTypeEnum]
    attr_accessor :place_type

    # TODO: Write general description for this method
    # @return [LocationModel]
    attr_accessor :within

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['id'] = 'id'
      @_hash['fully_qualified_place_name'] = 'fully_qualified_place_name'
      @_hash['canonical_name'] = 'canonical_name'
      @_hash['bounding_box'] = 'bounding_box'
      @_hash['area'] = 'area'
      @_hash['place_type'] = 'place_type'
      @_hash['within'] = 'within'
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

    def initialize(id = nil,
                   fully_qualified_place_name = nil,
                   canonical_name = nil,
                   bounding_box = nil,
                   area = nil,
                   place_type = nil,
                   within = nil,
                   additional_properties = {})
      @id = id unless id == SKIP
      unless fully_qualified_place_name == SKIP
        @fully_qualified_place_name =
          fully_qualified_place_name
      end
      @canonical_name = canonical_name unless canonical_name == SKIP
      @bounding_box = bounding_box unless bounding_box == SKIP
      @area = area unless area == SKIP
      @place_type = place_type unless place_type == SKIP
      @within = within unless within == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      id = hash.key?('id') ? hash['id'] : SKIP
      fully_qualified_place_name =
        hash.key?('fully_qualified_place_name') ? hash['fully_qualified_place_name'] : SKIP
      canonical_name =
        hash.key?('canonical_name') ? hash['canonical_name'] : SKIP
      bounding_box = hash.key?('bounding_box') ? hash['bounding_box'] : SKIP
      area = hash.key?('area') ? hash['area'] : SKIP
      place_type = hash.key?('place_type') ? hash['place_type'] : SKIP
      within = LocationModel.from_hash(hash['within']) if hash['within']

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      LocationModel.new(id,
                        fully_qualified_place_name,
                        canonical_name,
                        bounding_box,
                        area,
                        place_type,
                        within,
                        hash)
    end
  end
end