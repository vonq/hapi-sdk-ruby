
# Ordered Products Status Item Model

## Structure

`OrderedProductsStatusItemModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `product_id` | `String` | Optional | - |
| `status` | [`ChannelStatusEnum`](../../doc/models/channel-status-enum.md) | Optional | Status of the product. One of the following |
| `status_description` | `String` | Optional | Additional information about product status |

## Example (as JSON)

```json
{
  "productId": null,
  "status": null,
  "statusDescription": null
}
```

