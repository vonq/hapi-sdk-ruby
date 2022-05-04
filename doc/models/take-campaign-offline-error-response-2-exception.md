
# Take Campaign Offline Error Response 2 Exception

## Structure

`TakeCampaignOfflineErrorResponse2Exception`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `campaign_id` | `Array<String>` | Required | - |
| `status` | `Array<String>` | Required | - |

## Example (as JSON)

```json
{
  "campaignId": [
    "The campaignId in the request body should match the campaignId in the request URL."
  ],
  "status": [
    "This value should not be blank.",
    "This value should be equal to \"offline\""
  ]
}
```

