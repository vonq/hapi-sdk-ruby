# Campaigns

```ruby
campaigns_controller = client.campaigns
```

## Class Name

`CampaignsController`

## Methods

* [Check Campaign Status](../../doc/controllers/campaigns.md#check-campaign-status)
* [List Campaigns](../../doc/controllers/campaigns.md#list-campaigns)
* [Order Campaign](../../doc/controllers/campaigns.md#order-campaign)
* [Retrieve Campaign](../../doc/controllers/campaigns.md#retrieve-campaign)
* [Take Campaign Offline](../../doc/controllers/campaigns.md#take-campaign-offline)


# Check Campaign Status

This is a specialized endpoint for Campaign statuses only. Although the Campaign Details endpoint also returns the
status of a campaign, if you only need to get the specific status of a Campaign, this endpoint is
optimized for that.

```ruby
def check_campaign_status(campaign_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `campaign_id` | `UUID \| String` | Template, Required | Id of the Campaign you want the status of |

## Response Type

[`CheckCampaignStatusresponseModel`](../../doc/models/check-campaign-statusresponse-model.md)

## Example Usage

```ruby
campaign_id = '000026a2-0000-0000-0000-000000000000'

result = campaigns_controller.check_campaign_status(campaign_id)
```

## Example Response *(as JSON)*

```json
{
  "data": {
    "campaignId": "ffb37e76-d4fe-5ad6-8441-b02c1b15aa4c",
    "status": "online",
    "orderedProductsStatuses": [
      {
        "productId": "8eefb7a1-c5f3-5739-9fe6-cea17e2ee742",
        "status": "online",
        "statusDescription": "null"
      }
    ]
  }
}
```


# List Campaigns

Displays all the existing Campaigns already ordered for this Partner is as simple as executing a `GET`
request against the endpoint `/campaigns`

```ruby
def list_campaigns(company_id,
                   limit: nil,
                   offset: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `company_id` | `String` | Query, Required | CompanyId to filter the results on |
| `limit` | `Float` | Query, Optional | Amount of products returned |
| `offset` | `Float` | Query, Optional | Starting point |

## Response Type

[`ResultSet1Model`](../../doc/models/result-set-1-model.md)

## Example Usage

```ruby
company_id = 'companyId0'

result = campaigns_controller.list_campaigns(company_id, )
```

## Example Response *(as JSON)*

```json
{
  "total": 1337,
  "limit": 50,
  "offset": 0,
  "data": [
    {
      "companyId": "dd1c5be0-b0e1-41c8-ba92-e876da16c38b",
      "orderReference": "PO_567_2019",
      "recruiterInfo": {
        "id": "af78ce39-94a8-45dc-8c68-35f4d684fa5f",
        "name": "John Doe",
        "emailAddress": "john.doe@vonq.com"
      },
      "campaignName": "Software Development Manager",
      "postingDetails": {
        "title": "Come work for us, we're looking for amazing Software Developers",
        "description": "Are you a LEADER and a BUILDER?  Global is looking for individuals who are dynamic, sales-oriented, and who want to control their destiny.  With a full training programme and consistent support, Global will provide you with the tools to excel in this very lucrative business.",
        "organization": {
          "name": "Vonq",
          "companyLogo": "http://static.ats.com/public/vonq-company-logo.png"
        },
        "workingLocation": {
          "addressLine1": "Westblaak 175",
          "postcode": "3012 KJ",
          "city": "Rotterdam",
          "country": "The Netherlands",
          "allowsRemoteWork": 0
        },
        "contactInfo": {
          "name": "Janet Doe",
          "phoneNumber": "+31 6 5555 5555",
          "emailAddress": "janet.doe@vonq.com"
        },
        "yearsOfExperience": 5,
        "employmentType": "permanent",
        "weeklyWorkingHours": {
          "from": 32,
          "to": 40
        },
        "salaryIndication": {
          "period": "yearly",
          "range": {
            "from": 56000,
            "to": 60000,
            "currency": "EUR"
          }
        },
        "jobPageUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda",
        "applicationUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda/apply"
      },
      "targetGroup": {
        "educationLevel": [
          {
            "description": "Vendor-specific value",
            "vonqId": "23"
          }
        ],
        "seniority": [
          {
            "description": "Vendor-specific value",
            "vonqId": "23"
          }
        ],
        "industry": [
          {
            "description": "Vendor-specific value",
            "vonqId": "23"
          }
        ],
        "jobCategory": [
          {
            "description": "Vendor-specific value",
            "vonqId": "23"
          }
        ]
      },
      "orderedProducts": [
        "89",
        "889",
        "2cbad29e-a510-52fc-bbdf-e873320e89f5"
      ],
      "orderedProductsSpecs": [
        {
          "productId": "2cbad29e-a510-52fc-bbdf-e873320e89f5",
          "status": "online",
          "statusDescription": "",
          "deliveredOn": "2020-11-30T11:00:15+0000",
          "duration": "20 days",
          "durationPeriod": {
            "range": "days",
            "period": 30
          },
          "utm": "utm_medium=social&utm_source=facebook&utm_campaign=example",
          "jobBoardLink": "http://job.ad.com/software-developer",
          "contractId": "06a8f6f0-5e0e-4614-869e-ab95a8530633",
          "postingRequirements": {
            "someText": "example",
            "multipleSelectField": [
              "123",
              "234"
            ],
            "someIntValue": 22
          }
        }
      ],
      "postings": [
        {
          "name": "Linkedin.com 30 days",
          "clicks": 14
        }
      ]
    }
  ]
}
```


# Order Campaign

Once your Customer has decided on a list of Channels they would like to buy, you can send the list along with
publishing information as a `POST` request in order to create a `Campaign`. In return, you'll receive
the id of the newly created `Campaign` along with the URL where you can access that Campaign information.
For "My Contracts" type of Products, there is no expiration. The vacancy can be taken offline either by the job board or manually, by calling the "[Take a campaign offline](https://vonq.stoplight.io/docs/hapi/b3A6MzM0NDA3MzQ-take-a-campaign-offline)" endpoint.

#### Target group

You should use the following endpoints for the target group information:

- [**`Industry`**](b3A6MzM0NDA3Mzg-industry-names)

- [**`Job Function`**](b3A6MzM0NDA3MzU-job-functions)

- [**`Education Level`**](b3A6MzM0NDA3Mzk-retrieve-education-level-taxonomy)

- [**`Seniority`**](b3A6MzM0NDA3NDA-retrieve-seniority-taxonomy)

```ruby
def order_campaign(body,
                   company_id: nil,
                   limit: nil,
                   offset: nil,
                   x_customer_id: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`CampaignOrderModel`](../../doc/models/campaign-order-model.md) | Body, Required | - |
| `company_id` | `String` | Query, Optional | - |
| `limit` | `String` | Query, Optional | - |
| `offset` | `String` | Query, Optional | - |
| `x_customer_id` | `String` | Header, Optional | The ID of the end-user creating the order. Only required if you are using HAPI Job Post and creating orders with contracts. |

## Response Type

[`OrderCampaignSuccessResponseModel`](../../doc/models/order-campaign-success-response-model.md)

## Example Usage

```ruby
body = CampaignOrderModel.new
body.company_id = 'dd1c5be0-b0e1-41c8-ba92-e876da16c38b'
body.recruiter_info = RecruiterInfoModel.new
body.recruiter_info.name = 'John Doe'
body.posting_details = PostingDetailsModel.new
body.posting_details.title = 'Come work for us, we\'re looking for amazing Software Developers'
body.posting_details.description = 'Are you a LEADER and a BUILDER?  Global is looking for individuals who are dynamic, sales-oriented, and who want to control their destiny.  With a full training programme and consistent support, Global will provide you with the tools to excel in this very lucrative business.'
body.posting_details.organization = PostingOrganizationModel.new
body.posting_details.organization.name = 'Vonq'
body.posting_details.organization.company_logo = 'http://static.ats.com/public/vonq-company-logo.png'
body.posting_details.working_location = PostingWorkingLocationModel.new
body.posting_details.working_location.address_line1 = 'Westblaak 175'
body.posting_details.working_location.postcode = '3012 KJ'
body.posting_details.working_location.city = 'Rotterdam'
body.posting_details.working_location.country = 'The Netherlands'
body.posting_details.years_of_experience = 220.92
body.posting_details.employment_type = EmploymentTypeEnum::PERMANENT
body.posting_details.weekly_working_hours = PostingWeeklyWorkingHoursModel.new
body.posting_details.weekly_working_hours.to = 69.94
body.posting_details.salary_indication = PostingSalaryIndicationModel.new
body.posting_details.salary_indication.period = PeriodEnum::YEARLY
body.posting_details.salary_indication.range = Range3Model.new
body.posting_details.salary_indication.range.to = 22.8
body.posting_details.job_page_url = 'http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda'
body.posting_details.application_url = 'http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda/apply'
body.target_group = TargetGroupModel.new
body.target_group.education_level = []


body.target_group.education_level[0] = TargetGroupElementModel.new
body.target_group.education_level[0].description = 'Element name'
body.target_group.education_level[0].vonq_id = '23'

body.target_group.education_level[1] = TargetGroupElementModel.new
body.target_group.education_level[1].description = 'Element name'
body.target_group.education_level[1].vonq_id = '23'

body.target_group.seniority = []


body.target_group.seniority[0] = TargetGroupElementModel.new
body.target_group.seniority[0].description = 'Element name'
body.target_group.seniority[0].vonq_id = '23'

body.target_group.seniority[1] = TargetGroupElementModel.new
body.target_group.seniority[1].description = 'Element name'
body.target_group.seniority[1].vonq_id = '23'

body.target_group.seniority[2] = TargetGroupElementModel.new
body.target_group.seniority[2].description = 'Element name'
body.target_group.seniority[2].vonq_id = '23'

body.target_group.industry = []


body.target_group.industry[0] = TargetGroupElementModel.new
body.target_group.industry[0].description = 'Element name'
body.target_group.industry[0].vonq_id = '23'

body.target_group.industry[1] = TargetGroupElementModel.new
body.target_group.industry[1].description = 'Element name'
body.target_group.industry[1].vonq_id = '23'

body.target_group.industry[2] = TargetGroupElementModel.new
body.target_group.industry[2].description = 'Element name'
body.target_group.industry[2].vonq_id = '23'

body.target_group.job_category = []


body.target_group.job_category[0] = TargetGroupElementModel.new
body.target_group.job_category[0].description = 'Element name'
body.target_group.job_category[0].vonq_id = '23'

body.target_group.job_category[1] = TargetGroupElementModel.new
body.target_group.job_category[1].description = 'Element name'
body.target_group.job_category[1].vonq_id = '23'

body.ordered_products = ['orderedProducts2']

result = campaigns_controller.order_campaign(body, )
```

## Example Response *(as JSON)*

```json
{
  "campaignId": "ffb37e76-d4fe-5ad6-8441-b02c1b15aa4c"
}
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | [`OrderCampaignErrorResponseException`](../../doc/models/order-campaign-error-response-exception.md) |


# Retrieve Campaign

Retrieve the details of a specific Campaign. Only Campaigns created by the calling Partner can be
retrieved.

```ruby
def retrieve_campaign(campaign_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `campaign_id` | `UUID \| String` | Template, Required | Id of the Campaign that you want to retrieve |

## Response Type

[`ListCampaignResponseModel`](../../doc/models/list-campaign-response-model.md)

## Example Usage

```ruby
campaign_id = '000026a2-0000-0000-0000-000000000000'

result = campaigns_controller.retrieve_campaign(campaign_id)
```

## Example Response *(as JSON)*

```json
{
  "data": {
    "companyId": "dd1c5be0-b0e1-41c8-ba92-e876da16c38b",
    "orderReference": "PO_567_2019",
    "recruiterInfo": {
      "id": "af78ce39-94a8-45dc-8c68-35f4d684fa5f",
      "name": "John Doe",
      "emailAddress": "john.doe@vonq.com"
    },
    "campaignName": "Software Development Manager",
    "postingDetails": {
      "title": "Come work for us, we're looking for amazing Software Developers",
      "description": "Are you a LEADER and a BUILDER?  Global is looking for individuals who are dynamic, sales-oriented, and who want to control their destiny.  With a full training programme and consistent support, Global will provide you with the tools to excel in this very lucrative business.",
      "organization": {
        "name": "Vonq",
        "companyLogo": "http://static.ats.com/public/vonq-company-logo.png"
      },
      "workingLocation": {
        "addressLine1": "Westblaak 175",
        "postcode": "3012 KJ",
        "city": "Rotterdam",
        "country": "The Netherlands",
        "allowsRemoteWork": 0
      },
      "contactInfo": {
        "name": "Janet Doe",
        "phoneNumber": "+31 6 5555 5555",
        "emailAddress": "janet.doe@vonq.com"
      },
      "yearsOfExperience": 5,
      "employmentType": "permanent",
      "weeklyWorkingHours": {
        "from": 32,
        "to": 40
      },
      "salaryIndication": {
        "period": "yearly",
        "range": {
          "from": 56000,
          "to": 60000,
          "currency": "EUR"
        }
      },
      "jobPageUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda",
      "applicationUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda/apply"
    },
    "targetGroup": {
      "educationLevel": [
        {
          "description": "Vendor-specific value",
          "vonqId": "23"
        }
      ],
      "seniority": [
        {
          "description": "Vendor-specific value",
          "vonqId": "23"
        }
      ],
      "industry": [
        {
          "description": "Vendor-specific value",
          "vonqId": "23"
        }
      ],
      "jobCategory": [
        {
          "description": "Vendor-specific value",
          "vonqId": "23"
        }
      ]
    },
    "orderedProducts": [
      "89",
      "889",
      "2cbad29e-a510-52fc-bbdf-e873320e89f5"
    ],
    "orderedProductsSpecs": [
      {
        "productId": "2cbad29e-a510-52fc-bbdf-e873320e89f5",
        "status": "online",
        "statusDescription": "",
        "deliveredOn": "2020-11-30T11:00:15+0000",
        "duration": "20 days",
        "durationPeriod": {
          "range": "days",
          "period": 30
        },
        "utm": "utm_medium=social&utm_source=facebook&utm_campaign=example",
        "jobBoardLink": "http://job.ad.com/software-developer",
        "contractId": "06a8f6f0-5e0e-4614-869e-ab95a8530633",
        "postingRequirements": {
          "someText": "example",
          "multipleSelectField": [
            "123",
            "234"
          ],
          "someIntValue": 22
        }
      }
    ],
    "postings": [
      {
        "name": "Linkedin.com 30 days",
        "clicks": 14
      }
    ]
  }
}
```


# Take Campaign Offline

Specific endpoint to take a campaign offline. Keep in mind that processing this might
take some time and it only has an effect if the campaign's status is "online".

```ruby
def take_campaign_offline(campaign_id,
                          body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `campaign_id` | `UUID \| String` | Template, Required | Id of the Campaign you want to take offline |
| `body` | [`TakeCampaignOfflineRequestModel`](../../doc/models/take-campaign-offline-request-model.md) | Body, Required | - |

## Response Type

[`TakeCampaignOfflineResponseModel`](../../doc/models/take-campaign-offline-response-model.md)

## Example Usage

```ruby
campaign_id = '000026a2-0000-0000-0000-000000000000'
body = TakeCampaignOfflineRequestModel.new
body.campaign_id = 'ffb37e76-d4fe-5ad6-8441-b02c1b15aa4c'
body.status = 'offline'

result = campaigns_controller.take_campaign_offline(campaign_id, body)
```

## Example Response *(as JSON)*

```json
{
  "campaignId": "ffb37e76-d4fe-5ad6-8441-b02c1b15aa4c"
}
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | [`TakeCampaignOfflineErrorResponse2Exception`](../../doc/models/take-campaign-offline-error-response-2-exception.md) |
| 404 | - | [`TakeCampaignOfflineErrorResponseException`](../../doc/models/take-campaign-offline-error-response-exception.md) |

