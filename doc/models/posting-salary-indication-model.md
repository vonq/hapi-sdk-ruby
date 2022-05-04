
# Posting Salary Indication Model

## Structure

`PostingSalaryIndicationModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `period` | [`PeriodEnum`](../../doc/models/period-enum.md) | Required | - |
| `range` | [`Range3Model`](../../doc/models/range-3-model.md) | Required | - |

## Example (as JSON)

```json
{
  "period": "yearly",
  "range": {
    "to": 60000
  }
}
```

