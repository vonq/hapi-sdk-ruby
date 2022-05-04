
# Contract Model

## Structure

`ContractModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `contract_id` | `String` | Required | The identifier of the Contract. To be used when creating a Campaign |
| `customer_id` | `String` | Required | The customer_id this contract belongs to. Based on the original `X-Customer-Id` header used when the contract was created. |
| `channel_id` | `Float` | Required | The Channel (job board) the contract is to be used for |
| `credentials` | `Object` | Required | AES Encrypted credentials |
| `class_name` | `String` | Required | Channel slug |
| `facets` | `Object` | Required | An object with contract parameters |
| `product` | [`ContractProductModel`](../../doc/models/contract-product-model.md) | Required | The Product to be used in combination with the Contract when ordering a Campaign. |
| `posting_requirements` | [`Array<FacetModel>`](../../doc/models/facet-model.md) | Required | A list of the Contract Channel's Facets |
| `expiry_date` | `DateTime` | Optional | - |
| `credits` | `Float` | Optional | - |
| `purchase_price` | [`ContractPurchasePriceModel`](../../doc/models/contract-purchase-price-model.md) | Optional | - |

## Example (as JSON)

```json
{
  "contract_id": "06a8f6f0-5e0e-4614-869e-ab95a8530633",
  "customer_id": "c0cbefa5-6f04-4dbc-8208-5963bc433166",
  "channel_id": 0,
  "credentials": null,
  "class_name": null,
  "facets": null,
  "product": null,
  "posting_requirements": {
    "name": null,
    "label": null,
    "sort": null,
    "required": null,
    "type": "AUTOCOMPLETE",
    "options": null
  }
}
```

