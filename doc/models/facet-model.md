
# Facet Model

## Structure

`FacetModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Required | The name of the Facet. To be used as a key when ordering a Campaign, under the `orderedProductsSpecs.postingRequirements` key. |
| `label` | `String` | Required | The user facing label |
| `sort` | `String` | Required | The order in the list of vacancy fields to be displayed to the user when posting. Facets with lower `sort` values should be displayed first. |
| `required` | `Boolean` | Required | Whether the Facet is required when ordering a Campaign. |
| `type` | [`TypeEnum`](../../doc/models/type-enum.md) | Required | The type of UI and data structure to be used to input and store values for this Facet. |
| `options` | [`Array<FacetOptionModel>`](../../doc/models/facet-option-model.md) | Required | list of choices for this Facet's value. |
| `rules` | [`Array<FacetRuleModel>`](../../doc/models/facet-rule-model.md) | Optional | special validation rules that apply for this Facet's value |
| `autocomplete` | [`AutocompleteModel`](../../doc/models/autocomplete-model.md) | Optional | Used for Facets whose value choices need to be fetched through an additional call to the [List autocomplete values for posting requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-autocomplete-values-for-posting-requirement) endpoint. |

## Example (as JSON)

```json
{
  "name": null,
  "label": null,
  "sort": null,
  "required": null,
  "type": "AUTOCOMPLETE",
  "options": null
}
```

