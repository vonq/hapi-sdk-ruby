
# Posting Working Location Model

## Structure

`PostingWorkingLocationModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `address_line_1` | `String` | Required | - |
| `address_line_2` | `String` | Optional | - |
| `postcode` | `String` | Required | - |
| `city` | `String` | Required | - |
| `country` | `String` | Required | - |
| `allows_remote_work` | `Float` | Optional | Optional parameter allowing remote work, possible values are 0 and 1, defaults to 0 |

## Example (as JSON)

```json
{
  "addressLine1": "Westblaak 175",
  "postcode": "3012 KJ",
  "city": "Rotterdam",
  "country": "The Netherlands"
}
```

