
# List Channels Response Model

## Structure

`ListChannelsResponseModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `count` | `Integer` | Required | - |
| `mnext` | `String` | Optional | - |
| `previous` | `String` | Optional | - |
| `results` | [`Array<ChannelLiteModel>`](../../doc/models/channel-lite-model.md) | Required | - |

## Example (as JSON)

```json
{
  "count": 60,
  "next": null,
  "previous": null,
  "results": [
    {
      "mc_enabled": true,
      "id": 29,
      "name": "name3",
      "url": "url7",
      "type": "type7"
    }
  ]
}
```

