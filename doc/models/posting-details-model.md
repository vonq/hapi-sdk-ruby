
# Posting Details Model

## Structure

`PostingDetailsModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `title` | `String` | Required | The title of the posting across the different Channels where the posting is going to be published. |
| `description` | `String` | Required | Full description of the job posting, including all possible sections<br><br>**Allowed tags:** `a[href\|target], em, b, br, strong, i, li, ol, p, ul` |
| `organization` | [`PostingOrganizationModel`](../../doc/models/posting-organization-model.md) | Required | - |
| `working_location` | [`PostingWorkingLocationModel`](../../doc/models/posting-working-location-model.md) | Required | - |
| `contact_info` | [`PostingContactInfoModel`](../../doc/models/posting-contact-info-model.md) | Optional | Contact is whom to contact about the job. This may be part of the posting info for candidates to know whom they can reach out to learn more about the vacancy. |
| `years_of_experience` | `Float` | Required | Numbers of years of experience required for this position |
| `employment_type` | [`EmploymentTypeEnum`](../../doc/models/employment-type-enum.md) | Required | The type of employment of the posting, whether it's a permanent position or a fixed time position |
| `weekly_working_hours` | [`PostingWeeklyWorkingHoursModel`](../../doc/models/posting-weekly-working-hours-model.md) | Required | - |
| `salary_indication` | [`PostingSalaryIndicationModel`](../../doc/models/posting-salary-indication-model.md) | Required | - |
| `job_page_url` | `String` | Required | Link to the page with the description of the job |
| `application_url` | `String` | Required | Link to the page where the candidate needs to be directed when applying for a position |

## Example (as JSON)

```json
{
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
    "country": "The Netherlands"
  },
  "yearsOfExperience": 5,
  "employmentType": "permanent",
  "weeklyWorkingHours": {
    "to": 40
  },
  "salaryIndication": {
    "period": "yearly",
    "range": {
      "to": 60000
    }
  },
  "jobPageUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda",
  "applicationUrl": "http://amadeus-hospitality-it-careers.com/vacancy/software-development-manager-breda/apply"
}
```

