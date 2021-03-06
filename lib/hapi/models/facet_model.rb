# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # FacetModel Model.
  class FacetModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # The name of the Facet. To be used as a key when ordering a Campaign, under
    # the `orderedProductsSpecs.postingRequirements` key.
    # @return [String]
    attr_accessor :name

    # The user facing label
    # @return [String]
    attr_accessor :label

    # The order in the list of vacancy fields to be displayed to the user when
    # posting. Facets with lower `sort` values should be displayed first.
    # @return [String]
    attr_accessor :sort

    # Whether the Facet is required when ordering a Campaign.
    # @return [Boolean]
    attr_accessor :required

    # The type of UI and data structure to be used to input and store values for
    # this Facet.
    # @return [TypeEnum]
    attr_accessor :type

    # list of choices for this Facet's value.
    # @return [List of FacetOptionModel]
    attr_accessor :options

    # special validation rules that apply for this Facet's value
    # @return [List of FacetRuleModel]
    attr_accessor :rules

    # Used for Facets whose value choices need to be fetched through an
    # additional call to the [List autocomplete values for posting
    # requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-aut
    # ocomplete-values-for-posting-requirement) endpoint.
    # @return [AutocompleteModel]
    attr_accessor :autocomplete

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['name'] = 'name'
      @_hash['label'] = 'label'
      @_hash['sort'] = 'sort'
      @_hash['required'] = 'required'
      @_hash['type'] = 'type'
      @_hash['options'] = 'options'
      @_hash['rules'] = 'rules'
      @_hash['autocomplete'] = 'autocomplete'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        rules
        autocomplete
      ]
    end

    # An array for nullable fields
    def nullables
      %w[
        autocomplete
      ]
    end

    def initialize(name = nil,
                   label = nil,
                   sort = nil,
                   required = nil,
                   type = nil,
                   options = nil,
                   rules = nil,
                   autocomplete = nil,
                   additional_properties = {})
      @name = name unless name == SKIP
      @label = label unless label == SKIP
      @sort = sort unless sort == SKIP
      @required = required unless required == SKIP
      @type = type unless type == SKIP
      @options = options unless options == SKIP
      @rules = rules unless rules == SKIP
      @autocomplete = autocomplete unless autocomplete == SKIP

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
      required = hash.key?('required') ? hash['required'] : SKIP
      type = hash.key?('type') ? hash['type'] : SKIP
      # Parameter is an array, so we need to iterate through it
      options = nil
      unless hash['options'].nil?
        options = []
        hash['options'].each do |structure|
          options << (FacetOptionModel.from_hash(structure) if structure)
        end
      end

      options = SKIP unless hash.key?('options')
      # Parameter is an array, so we need to iterate through it
      rules = nil
      unless hash['rules'].nil?
        rules = []
        hash['rules'].each do |structure|
          rules << (FacetRuleModel.from_hash(structure) if structure)
        end
      end

      rules = SKIP unless hash.key?('rules')
      autocomplete = AutocompleteModel.from_hash(hash['autocomplete']) if hash['autocomplete']

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      FacetModel.new(name,
                     label,
                     sort,
                     required,
                     type,
                     options,
                     rules,
                     autocomplete,
                     hash)
    end
  end
end
