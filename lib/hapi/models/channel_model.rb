# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # ChannelModel Model.
  class ChannelModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # The name of a channel
    # @return [String]
    attr_accessor :name

    # The url of a channel
    # @return [String]
    attr_accessor :url

    # The type of a channel
    # @return [ChannelTypeEnum]
    attr_accessor :type

    # Does a channel support My Contracts
    # @return [Boolean]
    attr_accessor :mc_enabled

    # Does a channel support My Contracts
    # @return [List of ContractCredentialModel]
    attr_accessor :contract_credentials

    # Does a channel support My Contracts
    # @return [List of Object]
    attr_accessor :contract_facets

    # Dynamic posting requirements for MC products, used to provide additional
    # data with vacancies
    # @return [List of FacetModel]
    attr_accessor :posting_requirements

    # Some Channels require manual setup done by the end-user. In most such
    # cases, `setup_instructions` should contain HTML
    # @return [Boolean]
    attr_accessor :manual_setup_required

    # Additional setup instructions required to post on the Channel
    # @return [String]
    attr_accessor :setup_instructions

    # Some channels like apec.fr require the user to send the job board an XML
    # url. If not null, this value should be displayed to the user, along with
    # the `setup_instructions`
    # @return [String]
    attr_accessor :feed_url

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['name'] = 'name'
      @_hash['url'] = 'url'
      @_hash['type'] = 'type'
      @_hash['mc_enabled'] = 'mc_enabled'
      @_hash['contract_credentials'] = 'contract_credentials'
      @_hash['contract_facets'] = 'contract_facets'
      @_hash['posting_requirements'] = 'posting_requirements'
      @_hash['manual_setup_required'] = 'manual_setup_required'
      @_hash['setup_instructions'] = 'setup_instructions'
      @_hash['feed_url'] = 'feed_url'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        setup_instructions
        feed_url
      ]
    end

    # An array for nullable fields
    def nullables
      %w[
        setup_instructions
        feed_url
      ]
    end

    def initialize(name = nil,
                   url = nil,
                   type = nil,
                   mc_enabled = nil,
                   contract_credentials = nil,
                   contract_facets = nil,
                   posting_requirements = nil,
                   manual_setup_required = nil,
                   setup_instructions = nil,
                   feed_url = nil,
                   additional_properties = {})
      @name = name unless name == SKIP
      @url = url unless url == SKIP
      @type = type unless type == SKIP
      @mc_enabled = mc_enabled unless mc_enabled == SKIP
      @contract_credentials = contract_credentials unless contract_credentials == SKIP
      @contract_facets = contract_facets unless contract_facets == SKIP
      @posting_requirements = posting_requirements unless posting_requirements == SKIP
      @manual_setup_required = manual_setup_required unless manual_setup_required == SKIP
      @setup_instructions = setup_instructions unless setup_instructions == SKIP
      @feed_url = feed_url unless feed_url == SKIP

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
      url = hash.key?('url') ? hash['url'] : SKIP
      type = hash.key?('type') ? hash['type'] : SKIP
      mc_enabled = hash.key?('mc_enabled') ? hash['mc_enabled'] : SKIP
      # Parameter is an array, so we need to iterate through it
      contract_credentials = nil
      unless hash['contract_credentials'].nil?
        contract_credentials = []
        hash['contract_credentials'].each do |structure|
          contract_credentials << (ContractCredentialModel.from_hash(structure) if structure)
        end
      end

      contract_credentials = SKIP unless hash.key?('contract_credentials')
      contract_facets =
        hash.key?('contract_facets') ? hash['contract_facets'] : SKIP
      # Parameter is an array, so we need to iterate through it
      posting_requirements = nil
      unless hash['posting_requirements'].nil?
        posting_requirements = []
        hash['posting_requirements'].each do |structure|
          posting_requirements << (FacetModel.from_hash(structure) if structure)
        end
      end

      posting_requirements = SKIP unless hash.key?('posting_requirements')
      manual_setup_required =
        hash.key?('manual_setup_required') ? hash['manual_setup_required'] : SKIP
      setup_instructions =
        hash.key?('setup_instructions') ? hash['setup_instructions'] : SKIP
      feed_url = hash.key?('feed_url') ? hash['feed_url'] : SKIP

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      ChannelModel.new(name,
                       url,
                       type,
                       mc_enabled,
                       contract_credentials,
                       contract_facets,
                       posting_requirements,
                       manual_setup_required,
                       setup_instructions,
                       feed_url,
                       hash)
    end
  end
end
