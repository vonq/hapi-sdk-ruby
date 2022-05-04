
# Autocomplete Model

Used for Facets whose value choices need to be fetched through an additional call to the [List autocomplete values for posting requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-autocomplete-values-for-posting-requirement) endpoint.

## Structure

`AutocompleteModel`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `required_parameters` | [`Array<RequiredParameterEnum>`](../../doc/models/required-parameter-enum.md) | Required | List of keys to pass to  the body of the request calling the [List autocomplete values for posting requirements](https://vonq.stoplight.io/docs/hapi/b3A6MzM2MDEzODk-list-autocomplete-values-for-posting-requirement) endpoint. |

## Example (as JSON)

```json
{
  "required_parameters": [
    "term",
    "credentials",
    "term"
  ]
}
```

