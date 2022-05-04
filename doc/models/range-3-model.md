
# Range 3 Model

## Structure

`Range3Model`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `from` | `Float` | Optional | Minimum salary indication of the indicated period, if given, cannot be greater<br><br>than 'to', but equal to 'to' is allowed. This integer value should be specified in units (not cents). |
| `to` | `Float` | Required | Maximum salary indication of the indicated period. This integer value should be specified in units (not cents). |
| `currency` | `String` | Optional | The currency in which the range amount is expressed. Must be a valid ISO-4217 value. |

## Example (as JSON)

```json
{
  "to": 60000
}
```

