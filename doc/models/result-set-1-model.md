
# Result Set 1 Model

## Structure

`ResultSet1Model`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `total` | `Float` | Optional | Number of total results |
| `limit` | `Float` | Optional | Results page size |
| `offset` | `Float` | Optional | Initial starting index for the results |
| `data` | [`Array<CampaignModel>`](../../doc/models/campaign-model.md) | Optional | A Page of Campaign Objects |

## Example (as JSON)

```json
{
  "total": null,
  "limit": null,
  "offset": null,
  "data": null
}
```

