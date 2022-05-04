# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # TaxonomyController
  class TaxonomyController < BaseController
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # This endpoint returns a tree-like structure of supported Job Functions
    # that can be used to search for Products.
    # Use the `id` key of any Job Function in the response to search for a
    # Product.
    # Each Job Function is associated with [**`Job
    # Titles`**](b3A6MzM0NDA3MzY-job-titles) in a one-to-many fashion.
    # Besides the default English, German and Dutch result translations can be
    # requested by specifying an `Accept-Language: [de|nl]` header.
    # @param [AcceptLanguageEnum] accept_language Optional parameter: Example:
    # @return [List of JobFunctionModel] response from the API call
    def retrieve_job_functions_tree(accept_language: nil)
      begin
        @logger.info("retrieve_job_functions_tree called.")
        # Prepare query url.
        @logger.info("Preparing query URL for retrieve_job_functions_tree.")
        _query_builder = config.get_base_uri
        _query_builder << '/products/job-functions/'
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for retrieve_job_functions_tree.")
        _headers = {
          'accept' => 'application/json',
          'Accept-Language' => accept_language
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for retrieve_job_functions_tree.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'retrieve_job_functions_tree')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for retrieve_job_functions_tree.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| JobFunctionModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # This endpoint takes any text as input and returns a list of supported Job
    # Titles matching the query, ordered by popularity.
    # Use the `id` key of each object in the response to search for a Product.
    # Currently, we support 4,000 job titles for each of the following
    # languages: English, Dutch and German.
    # Each Job Title is associated with a [**`Job
    # Function`**](b3A6MzM0NDA3MzU-job-functions) in a many-to-one fashion.
    # Besides the default English, German and Dutch result translations can be
    # requested by specifying an `Accept-Language: [de|nl]` header.
    # @param [String] text Required parameter: Search text for a job title
    # name
    # @param [Float] limit Optional parameter: Number of results to return per
    # page.
    # @param [Float] offset Optional parameter: The initial index from which to
    # return the results.
    # @param [AcceptLanguageEnum] accept_language Optional parameter: Example:
    # @return [List of JobTitleModel] response from the API call
    def search_job_titles(text,
                          limit: nil,
                          offset: nil,
                          accept_language: nil)
      begin
        @logger.info("search_job_titles called.")
        # Prepare query url.
        @logger.info("Preparing query URL for search_job_titles.")
        _query_builder = config.get_base_uri
        _query_builder << '/products/job-titles/'
        _query_builder = APIHelper.append_url_with_query_parameters(
          _query_builder,
          'text' => text,
          'limit' => limit,
          'offset' => offset
        )
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for search_job_titles.")
        _headers = {
          'accept' => 'application/json',
          'Accept-Language' => accept_language
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for search_job_titles.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'search_job_titles')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for search_job_titles.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| JobTitleModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # This endpoint takes any text as input and returns a list of Locations
    # matching the query, ordered by popularity.
    # Each response will include the entire world as a Location, even no
    # Locations match the text query.
    # Use the `id` key of each object in the response to search for a Product.
    # Supports text input in English, Dutch and German.
    # @param [String] text Required parameter: Search text for a location name
    # in either English, Dutch, German, French and Italian. Partial recognition
    # of 20 other languages.
    # @return [List of LocationModel] response from the API call
    def search_locations(text)
      begin
        @logger.info("search_locations called.")
        # Prepare query url.
        @logger.info("Preparing query URL for search_locations.")
        _query_builder = config.get_base_uri
        _query_builder << '/products/location/search/'
        _query_builder = APIHelper.append_url_with_query_parameters(
          _query_builder,
          'text' => text
        )
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for search_locations.")
        _headers = {
          'accept' => 'application/json'
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for search_locations.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'search_locations')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for search_locations.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| LocationModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # This endpoint returns a list of supported industry names that can be used
    # to search for products. Results are ordered alphabetically.
    # Use the `id` key of any Industry in the response to search for a product.
    # Besides the default English, German and Dutch result translations can be
    # requested by specifying an `Accept-Language: [de|nl]` header.
    # @param [Float] limit Optional parameter: Number of results to return per
    # page.
    # @param [Float] offset Optional parameter: The initial index from which to
    # return the results.
    # @param [AcceptLanguageEnum] accept_language Optional parameter: Example:
    # @return [List of IndustryModel] response from the API call
    def list_industries(limit: nil,
                        offset: nil,
                        accept_language: nil)
      begin
        @logger.info("list_industries called.")
        # Prepare query url.
        @logger.info("Preparing query URL for list_industries.")
        _query_builder = config.get_base_uri
        _query_builder << '/products/industries/'
        _query_builder = APIHelper.append_url_with_query_parameters(
          _query_builder,
          'limit' => limit,
          'offset' => offset
        )
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for list_industries.")
        _headers = {
          'accept' => 'application/json',
          'Accept-Language' => accept_language
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for list_industries.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'list_industries')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for list_industries.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| IndustryModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # Retrieve all Education Level possible values.
    # @return [List of EducationLevelModel] response from the API call
    def retrieve_education_levels
      begin
        @logger.info("retrieve_education_levels called.")
        # Prepare query url.
        @logger.info("Preparing query URL for retrieve_education_levels.")
        _query_builder = config.get_base_uri
        _query_builder << '/taxonomy/education-levels'
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for retrieve_education_levels.")
        _headers = {
          'accept' => 'application/json'
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for retrieve_education_levels.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'retrieve_education_levels')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for retrieve_education_levels.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| EducationLevelModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # Retrieve all Seniority possible values.
    # @return [List of SeniorityModel] response from the API call
    def retrieve_seniorities
      begin
        @logger.info("retrieve_seniorities called.")
        # Prepare query url.
        @logger.info("Preparing query URL for retrieve_seniorities.")
        _query_builder = config.get_base_uri
        _query_builder << '/taxonomy/seniority'
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for retrieve_seniorities.")
        _headers = {
          'accept' => 'application/json'
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for retrieve_seniorities.')
        _request = config.http_client.get(
          _query_url,
          headers: _headers
        )
        _response = execute_request(_request, name: 'retrieve_seniorities')
        validate_response(_response)
  
        # Return appropriate response type.
        @logger.info("Returning response for retrieve_seniorities.")
        decoded = APIHelper.json_deserialize(_response.raw_body)
        decoded.map { |element| SeniorityModel.from_hash(element) }

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end
  end
end