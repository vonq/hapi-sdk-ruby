
# Order Campaign Error Response Exception

## Structure

`OrderCampaignErrorResponseException`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `company_id` | `Array<String>` | Required | - |
| `posting_details` | [`PostingDetailsErrorsModel`](../../doc/models/posting-details-errors-model.md) | Required | - |
| `target_group` | `Array<String>` | Required | - |
| `recruiter_info` | [`RecruiterInfoErrorsModel`](../../doc/models/recruiter-info-errors-model.md) | Required | - |
| `ordered_products` | `Array<String>` | Required | - |
| `ordered_products_specs` | [`Array<OrderedProductsSpecModel>`](../../doc/models/ordered-products-spec-model.md) | Required | - |

## Example (as JSON)

```json
{
  "companyId": [
    "This value should not be blank."
  ],
  "postingDetails": {
    "title": [
      "A Title of the Posting is required"
    ],
    "description": [
      "A Description of the Posting is required"
    ],
    "yearsOfExperience": [
      "This value should not be blank."
    ],
    "employmentType": [
      "A Posting needs a type of employment"
    ],
    "organization": {
      "name": [
        "This value should not be blank."
      ],
      "companyLogo": [
        "This value should not be blank."
      ]
    },
    "workingLocation": {
      "addressLine1": [
        "This value should not be blank."
      ],
      "postcode": [
        "This value should not be blank."
      ],
      "city": [
        "This value should not be blank."
      ],
      "country": [
        "This value should not be blank."
      ]
    },
    "weeklyWorkingHours": {
      "to": [
        "This value should not be blank."
      ]
    },
    "salaryIndication": {
      "period": [
        "A SalaryIndication needs a period"
      ],
      "range": {
        "to": [
          "This value should not be blank."
        ]
      }
    },
    "jobPageUrl": [
      "This value should not be blank."
    ],
    "applicationUrl": [
      "This value should not be blank."
    ]
  },
  "targetGroup": [
    "A Target Group entity should contain an EducationLevel",
    "A Target Group entity should contain a Seniority",
    "A Target Group entity should contain a Industry",
    "A Target Group entity should contain a Job Category"
  ],
  "recruiterInfo": {
    "name": [
      "This value should not be blank."
    ]
  },
  "orderedProducts": [
    "An Order must have at least 1 orderedProduct"
  ],
  "orderedProductsSpecs": [
    {
      "productId": [
        "This value should not be blank."
      ],
      "utm": [
        "This value should not be blank."
      ]
    }
  ]
}
```

