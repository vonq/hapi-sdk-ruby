# hapi
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Hapi
  # TargetGroupModel Model.
  class TargetGroupModel < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # Education Level required by the Candidate. You can specify only one value.
    # @return [List of TargetGroupElementModel]
    attr_accessor :education_level

    # Seniority Level expected by the Candidate. You can specify only one value.
    # @return [List of TargetGroupElementModel]
    attr_accessor :seniority

    # The Industry related to the Position open. You can specify only one value.
    # @return [List of TargetGroupElementModel]
    attr_accessor :industry

    # Job Category indicates the type of Position that's open. You can specify
    # only one value.
    # @return [List of TargetGroupElementModel]
    attr_accessor :job_category

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['education_level'] = 'educationLevel'
      @_hash['seniority'] = 'seniority'
      @_hash['industry'] = 'industry'
      @_hash['job_category'] = 'jobCategory'
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

    def initialize(education_level = nil,
                   seniority = nil,
                   industry = nil,
                   job_category = nil,
                   additional_properties = {})
      @education_level = education_level unless education_level == SKIP
      @seniority = seniority unless seniority == SKIP
      @industry = industry unless industry == SKIP
      @job_category = job_category unless job_category == SKIP

      # Add additional model properties to the instance.
      additional_properties.each do |_name, _value|
        instance_variable_set("@#{_name}", _value)
      end
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      # Parameter is an array, so we need to iterate through it
      education_level = nil
      unless hash['educationLevel'].nil?
        education_level = []
        hash['educationLevel'].each do |structure|
          education_level << (TargetGroupElementModel.from_hash(structure) if structure)
        end
      end

      education_level = SKIP unless hash.key?('educationLevel')
      # Parameter is an array, so we need to iterate through it
      seniority = nil
      unless hash['seniority'].nil?
        seniority = []
        hash['seniority'].each do |structure|
          seniority << (TargetGroupElementModel.from_hash(structure) if structure)
        end
      end

      seniority = SKIP unless hash.key?('seniority')
      # Parameter is an array, so we need to iterate through it
      industry = nil
      unless hash['industry'].nil?
        industry = []
        hash['industry'].each do |structure|
          industry << (TargetGroupElementModel.from_hash(structure) if structure)
        end
      end

      industry = SKIP unless hash.key?('industry')
      # Parameter is an array, so we need to iterate through it
      job_category = nil
      unless hash['jobCategory'].nil?
        job_category = []
        hash['jobCategory'].each do |structure|
          job_category << (TargetGroupElementModel.from_hash(structure) if structure)
        end
      end

      job_category = SKIP unless hash.key?('jobCategory')

      # Clean out expected properties from Hash.
      names.each_value { |k| hash.delete(k) }

      # Create object from extracted values.
      TargetGroupModel.new(education_level,
                           seniority,
                           industry,
                           job_category,
                           hash)
    end
  end
end
