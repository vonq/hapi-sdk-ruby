
# List Contracts Response Model

## Structure

`ListContractsResponseModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `count` | `Float` | Optional | count of elements in results |
| `previous` | `String` | Optional | link to get previous results |
| `mnext` | `String` | Optional | link to get next results |
| `results` | [`Array<ContractModel>`](../../doc/models/contract-model.md) | Optional | - |

## Example (as JSON)

```json
{
  "count": null,
  "previous": null,
  "next": null,
  "results": null
}
```

