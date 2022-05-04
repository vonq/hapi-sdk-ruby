# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # OrderCampaignErrorResponse class.
  class OrderCampaignErrorResponseException < APIException
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :company_id

    # TODO: Write general description for this method
    # @return [PostingDetailsErrorsModel]
    attr_accessor :posting_details

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :target_group

    # TODO: Write general description for this method
    # @return [RecruiterInfoErrorsModel]
    attr_accessor :recruiter_info

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :ordered_products

    # TODO: Write general description for this method
    # @return [List of OrderedProductsSpecModel]
    attr_accessor :ordered_products_specs

    # The constructor.
    # @param [String] The reason for raising an exception.
    # @param [HttpResponse] The HttpReponse of the API call.
    def initialize(reason, response)
      super(reason, response)
      hash = APIHelper.json_deserialize(@response.raw_body)
      unbox(hash)
    end

    # Populates this object by extracting properties from a hash.
    # @param [Hash] The deserialized response sent by the server in the
    # response body.
    def unbox(hash)
      @company_id = hash.key?('companyId') ? hash['companyId'] : SKIP
      @posting_details = PostingDetailsErrorsModel.from_hash(hash['postingDetails']) if
        hash['postingDetails']
      @target_group = hash.key?('targetGroup') ? hash['targetGroup'] : SKIP
      @recruiter_info = RecruiterInfoErrorsModel.from_hash(hash['recruiterInfo']) if
        hash['recruiterInfo']
      @ordered_products =
        hash.key?('orderedProducts') ? hash['orderedProducts'] : SKIP
      # Parameter is an array, so we need to iterate through it
      @ordered_products_specs = nil
      unless hash['orderedProductsSpecs'].nil?
        @ordered_products_specs = []
        hash['orderedProductsSpecs'].each do |structure|
          @ordered_products_specs << (OrderedProductsSpecModel.from_hash(structure) if structure)
        end
      end

      @ordered_products_specs = SKIP unless hash.key?('orderedProductsSpecs')
    end
  end
end
