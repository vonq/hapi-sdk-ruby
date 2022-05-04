
# Post Contract Model

## Structure

`PostContractModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `channel_id` | `Float` | Required | - |
| `credentials` | `Object` | Required | An object with credentials data |
| `facets` | `Object` | Optional | An object with product parameters |
| `followed_instructions` | `Boolean` | Optional | When creating contracts for Channels that require the end-user to follow instructions (based on the `manual_setup_required` key in the response body for the [Retrieve details for channel with support for contracts](https://vonq.stoplight.io/docs/hapi/b3A6NTUxMjYwODI-retrieve-details-for-channel-with-support-for-contracts) endpoint), set this value to `true` to confirm the user has done so. For quality purposes, setting this field to `true` for Channels that don't require following instructions will result in a 400 Bad Request. |
| `expiry_date` | `DateTime` | Optional | - |
| `credits` | `Float` | Optional | - |
| `purchase_price` | [`ContractPurchasePriceModel`](../../doc/models/contract-purchase-price-model.md) | Optional | - |

## Example (as JSON)

```json
{
  "channel_id": 0,
  "credentials": null
}
```

