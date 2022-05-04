
# Location Model

Location(id, canonical_name, desq_name_en, desq_country_code, country_code, mapbox_id, mapbox_text, mapbox_placename, mapbox_context, mapbox_place_type, mapbox_shortcode, mapbox_within)

## Structure

`LocationModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `Float` | Required | - |
| `fully_qualified_place_name` | `String` | Required | - |
| `canonical_name` | `String` | Required | - |
| `bounding_box` | `Array<Float>` | Required | - |
| `area` | `Float` | Required | - |
| `place_type` | [`PlaceTypeEnum`](../../doc/models/place-type-enum.md) | Required | - |
| `within` | [`LocationModel`](../../doc/models/location-model.md) | Required | - |

## Example (as JSON)

```json
{
  "id": null,
  "fully_qualified_place_name": null,
  "canonical_name": null,
  "bounding_box": null,
  "area": null,
  "place_type": "place",
  "within": {
    "id": null,
    "fully_qualified_place_name": null,
    "canonical_name": null,
    "bounding_box": null,
    "area": null,
    "place_type": "place",
    "within": null
  }
}
```

