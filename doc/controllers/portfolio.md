# Portfolio

```ruby
portfolio_controller = client.portfolio
```

## Class Name

`PortfolioController`

## Methods

* [Calculate Order Delivery Time](../../doc/controllers/portfolio.md#calculate-order-delivery-time)
* [Retrieve Multiple Products](../../doc/controllers/portfolio.md#retrieve-multiple-products)
* [Retrieve Single Product](../../doc/controllers/portfolio.md#retrieve-single-product)
* [Search Products](../../doc/controllers/portfolio.md#search-products)


# Calculate Order Delivery Time

This endpoint calculates total number of days to process and setup a campaign containing a list of Products, given a comma-separated list of their ids.

```ruby
def calculate_order_delivery_time(products_ids)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `products_ids` | `Array<String>` | Template, Required | - |

## Response Type

[`Array<ProductsDeliveryTimeModel>`](../../doc/models/products-delivery-time-model.md)

## Example Usage

```ruby
products_ids = ['products_ids7', 'products_ids8']

result = portfolio_controller.calculate_order_delivery_time(products_ids)
```

## Example Response *(as JSON)*

```json
[
  {
    "days_to_process": 1,
    "days_to_setup": 1,
    "total_days": 2
  }
]
```


# Retrieve Multiple Products

Sometimes you already have access to the Identification codes of more than one Product and you want to retrieve the most up-to-date information about them.
Besides the default English, German and Dutch result translations can be requested by specifying an `Accept-Language: [de|nl]` header.

```ruby
def retrieve_multiple_products(products_ids,
                               accept_language: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `products_ids` | `Array<String>` | Template, Required | - |
| `accept_language` | [`AcceptLanguageEnum`](../../doc/models/accept-language-enum.md) | Header, Optional | - |

## Response Type

[`Array<ProductModel>`](../../doc/models/product-model.md)

## Example Usage

```ruby
products_ids = ['products_ids7', 'products_ids8']
accept_language = AcceptLanguageEnum::EN

result = portfolio_controller.retrieve_multiple_products(products_ids, accept_language: accept_language)
```


# Retrieve Single Product

Sometimes you already have access to the Identification code of any particular Product and you want to retrieve the most up-to-date information about it.
Besides the default English, German and Dutch result translations can be requested by specifying an `Accept-Language: [de|nl]` header.

```ruby
def retrieve_single_product(product_id,
                            accept_language: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `product_id` | `String` | Template, Required | - |
| `accept_language` | [`AcceptLanguageEnum`](../../doc/models/accept-language-enum.md) | Header, Optional | - |

## Response Type

[`ProductModel`](../../doc/models/product-model.md)

## Example Usage

```ruby
product_id = 'product_id4'
accept_language = AcceptLanguageEnum::EN

result = portfolio_controller.retrieve_single_product(product_id, accept_language: accept_language)
```


# Search Products

For a detailed tutorial on how to get started with portfolio search v2, check out our [Quickstart Tutorial](https://pkb.stoplight.io/docs/search/docs/Tutorial.md).
For an implementation demo of the product search experience, check out our [Developer Portal](http://vonq.io/pkb).
This endpoint exposes a list of Products with the options to search by Location, Job Title, Job Function and Industry.
Products are ranked by their relevancy to the search terms.
Optionally, products can filtered by Location.
Values for each parameter can be fetched by calling the other endpoints in this section.
Calling this endpoint will guarantee that the Products you see are configured for you as our Partner.
Besides the default English, German and Dutch result translations can be requested by specifying an `Accept-Language: [de|nl]` header.

```ruby
def search_products(limit: nil,
                    offset: nil,
                    include_location_id: nil,
                    exact_location_id: nil,
                    job_function_id: nil,
                    job_title_id: nil,
                    industry_id: nil,
                    duration_from: nil,
                    duration_to: nil,
                    name: nil,
                    currency: nil,
                    sort_by: SortByEnum::RELEVANT,
                    recommended: nil,
                    mc_enabled: nil,
                    accept_language: nil,
                    exclude_recommended: false)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `limit` | `Integer` | Query, Optional | Number of results to return per page. |
| `offset` | `Integer` | Query, Optional | The initial index from which to return the results. |
| `include_location_id` | `Array<String>` | Query, Optional | Id for a Location to search products against. If no exact matches exist, search will be expanded to the Location's region and country. Optionally, a (comma-separated) array of values can be passed. Passing multiple values increases the number of search results. |
| `exact_location_id` | `String` | Query, Optional | Match only products specifically assigned to a Location. |
| `job_function_id` | `String` | Query, Optional | Job Function id. Not to be used in conjunction with a Job Title id. |
| `job_title_id` | `String` | Query, Optional | Job title id |
| `industry_id` | `Array<String>` | Query, Optional | Industry Id |
| `duration_from` | `String` | Query, Optional | Match only products with a duration more or equal than a certain number of days |
| `duration_to` | `String` | Query, Optional | Match only products with a duration up to a certain number of days |
| `name` | `String` | Query, Optional | Search text for a product name |
| `currency` | `String` | Query, Optional | ISO-4217 code for a currency |
| `sort_by` | [`SortByEnum`](../../doc/models/sort-by-enum.md) | Query, Optional | Which products to show first. Defaults to 'relevant'<br>**Default**: `SortByEnum::RELEVANT` |
| `recommended` | `Boolean` | Query, Optional | Whether to display a list of recommended products for the search parameters. If true, returns a limited list of products for the types: Job board, social media, publication and community. |
| `mc_enabled` | `Boolean` | Query, Optional | Can be used to filter for products that are linked to a channel enabled for My Contracts orders |
| `accept_language` | [`AcceptLanguageEnum`](../../doc/models/accept-language-enum.md) | Header, Optional | - |
| `exclude_recommended` | `Boolean` | Query, Optional | Exclude recommended products from search results. Cannot be used in combination with 'recommended'.<br>**Default**: `false` |

## Response Type

[`Array<ProductModel>`](../../doc/models/product-model.md)

## Example Usage

```ruby
sort_by = SortByEnum::RELEVANT
accept_language = AcceptLanguageEnum::EN
exclude_recommended = false

result = portfolio_controller.search_products(sort_by: sort_by, accept_language: accept_language, exclude_recommended: exclude_recommended)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | `APIException` |

