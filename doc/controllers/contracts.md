# Contracts

```ruby
contracts_controller = client.contracts
```

## Class Name

`ContractsController`

## Methods

* [Create Contract](../../doc/controllers/contracts.md#create-contract)
* [Delete Contract](../../doc/controllers/contracts.md#delete-contract)
* [List Autocomplete Values](../../doc/controllers/contracts.md#list-autocomplete-values)
* [List Channels](../../doc/controllers/contracts.md#list-channels)
* [List Contracts](../../doc/controllers/contracts.md#list-contracts)
* [Retrieve Channel](../../doc/controllers/contracts.md#retrieve-channel)
* [Retrieve Contract](../../doc/controllers/contracts.md#retrieve-contract)
* [Retrieve Multiple Contracts](../../doc/controllers/contracts.md#retrieve-multiple-contracts)


# Create Contract

This endpoint creates a new customer contract. It requires a reference to a channel, a credential payload, and the facets set for the contracted product.

HAPI doesn't support contract editing, because job boards require the same credentials to be able to delete already posted jobs via that contract at a later moment. Otherwise, deleting jobs would not be possible. To edit contract credentials, the credentials need to be deleted first, and then recreated. When deleted, all corresponding jobs can't be deleted anymore

```ruby
def create_contract(x_customer_id,
                    body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `x_customer_id` | `String` | Header, Required | An identifier for the remote customer |
| `body` | [`PostContractModel`](../../doc/models/post-contract-model.md) | Body, Required | - |

## Response Type

[`CreateContractResponseModel`](../../doc/models/create-contract-response-model.md)

## Example Usage

```ruby
x_customer_id = 'X-Customer-Id2'
body = PostContractModel.new
body.channel_id = 30.52
body.credentials = JSON.parse('{"key1":"val1","key2":"val2"}')

result = contracts_controller.create_contract(x_customer_id, body)
```

## Example Response *(as JSON)*

```json
{
  "customer_id": "76e124d4-ae69-4753-bede-259d505258b7",
  "contract_id": "3a283b8f-1670-404b-b804-92f67e66b71c",
  "channel_id": 13,
  "credentials": "",
  "class_name": "",
  "facets": {},
  "product": {
    "product_id": "2e8c3c17-179b-4db1-9e2b-d48369b5e409",
    "title": "product title"
  },
  "posting_requirements": "",
  "expiry_date": "2022-02-15T12:03:45.053Z",
  "credits": 0,
  "purchase_price": {
    "amount": 0,
    "currency": "string"
  }
}
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | `APIException` |


# Delete Contract

This endpoint deletes a contract.

HAPI doesn't support contract editing, because job boards require the same credentials to be able to delete already posted jobs via that contract at a later moment. Otherwise, deleting jobs would not be possible. To edit contract credentials, the credentials need to be deleted first, and then recreated. When deleted, all corresponding jobs can't be deleted anymore

```ruby
def delete_contract(contract_id,
                    x_customer_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `contract_id` | `String` | Template, Required | - |
| `x_customer_id` | `String` | Header, Required | An identifier for the remote customer |

## Response Type

`void`

## Example Usage

```ruby
contract_id = 'contract_id8'
x_customer_id = 'X-Customer-Id2'

result = contracts_controller.delete_contract(contract_id, x_customer_id)
```


# List Autocomplete Values

This endpoint exposes autocomplete items given a `channel_id` and a posting requirement name.

```ruby
def list_autocomplete_values(channel_id,
                             posting_requirement_name,
                             body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `channel_id` | `Float` | Template, Required | channel_id (number, required) |
| `posting_requirement_name` | `String` | Template, Required | - |
| `body` | [`FacetAutocompleteModel`](../../doc/models/facet-autocomplete-model.md) | Body, Required | - |

## Response Type

[`Array<AutocompleteValuesResponseModel>`](../../doc/models/autocomplete-values-response-model.md)

## Example Usage

```ruby
channel_id = 105.24
posting_requirement_name = 'posting-requirement-name2'
body = FacetAutocompleteModel.new

result = contracts_controller.list_autocomplete_values(channel_id, posting_requirement_name, body)
```

## Example Response *(as JSON)*

```json
[
  {
    "key": "A key",
    "label": "A label"
  },
  {
    "key": "A key",
    "label": "A label"
  },
  {
    "key": "A key",
    "label": "A label"
  }
]
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | `APIException` |


# List Channels

This endpoint exposes a list of channels with support for contracts. For all of the required details for creating a contract or a campaign for each channel, please call the "Retrieve details for channel with support for contracts".

```ruby
def list_channels(search: nil,
                  limit: nil,
                  offset: nil,
                  accept_language: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `search` | `String` | Query, Optional | A search term. |
| `limit` | `Integer` | Query, Optional | Number of results to return per page. |
| `offset` | `Integer` | Query, Optional | The initial index from which to return the results. |
| `accept_language` | [`AcceptLanguageEnum`](../../doc/models/accept-language-enum.md) | Header, Optional | The language the client prefers. |

## Response Type

[`ListChannelsResponseModel`](../../doc/models/list-channels-response-model.md)

## Example Usage

```ruby
accept_language = AcceptLanguageEnum::EN

result = contracts_controller.list_channels(accept_language: accept_language)
```

## Example Response *(as JSON)*

```json
{
  "count": 0,
  "next": "string",
  "previous": "string",
  "results": [
    {
      "mc_enabled": true,
      "id": 0,
      "name": "string",
      "url": "string",
      "type": "string"
    }
  ]
}
```


# List Contracts

This endpoint exposes a list of contract available to a particular customer.

```ruby
def list_contracts(x_customer_id,
                   limit: nil,
                   offset: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `x_customer_id` | `String` | Header, Required | An identifier for the remote customer |
| `limit` | `Float` | Query, Optional | Amount of contracts returned |
| `offset` | `Float` | Query, Optional | Starting point |

## Response Type

[`ListContractsResponseModel`](../../doc/models/list-contracts-response-model.md)

## Example Usage

```ruby
x_customer_id = 'X-Customer-Id2'

result = contracts_controller.list_contracts(x_customer_id, )
```

## Example Response *(as JSON)*

```json
{
  "count": 2,
  "next": "string",
  "previous": "string",
  "results": [
    {
      "customer_id": "76e124d4-ae69-4753-bede-259d505258b7",
      "contract_id": "3a283b8f-1670-404b-b804-92f67e66b71c",
      "channel_id": 13,
      "credentials": {},
      "class_name": "",
      "facets": {},
      "product": {
        "product_id": "2e8c3c17-179b-4db1-9e2b-d48369b5e409",
        "title": "product title"
      },
      "posting_requirements": [],
      "expiry_date": "2022-02-15T12:03:45.053Z",
      "credits": 0,
      "purchase_price": {
        "amount": 0,
        "currency": "string"
      }
    },
    {
      "customer_id": "76e124d4-ae69-4753-bede-259d505258b7",
      "contract_id": "3a283b8f-1670-404b-b804-92f67e66b71c",
      "channel_id": 13,
      "credentials": {},
      "class_name": "apecf_prod",
      "expiry_date": null,
      "credits": 5,
      "facets": {},
      "product": {
        "product_id": "2e8c3c17-179b-4db1-9e2b-d48369b5e409",
        "title": "product title"
      },
      "posting_requirements": []
    }
  ]
}
```


# Retrieve Channel

This endpoint exposes the details of a channel with support for contracts,as well as all the required details for creating a contract or a campaign for each channel.

```ruby
def retrieve_channel(channel_id,
                     accept_language: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `channel_id` | `String` | Template, Required | ID of the channel |
| `accept_language` | [`AcceptLanguageEnum`](../../doc/models/accept-language-enum.md) | Header, Optional | The language the client prefers. |

## Response Type

[`ChannelModel`](../../doc/models/channel-model.md)

## Example Usage

```ruby
channel_id = 'channel_id4'
accept_language = AcceptLanguageEnum::EN

result = contracts_controller.retrieve_channel(channel_id, accept_language: accept_language)
```

## Example Response *(as JSON)*

```json
{
  "id": 66,
  "name": "LinkedIn",
  "url": "https://www.linkedin.com",
  "type": "social media",
  "mc_enabled": true,
  "manual_setup_required": false,
  "setup_instructions": "<p>Please read the instructions on how to retrieve your setup details <a href=\"https://beheer.ingoedebanen.nl/documenten/JobDistributionPartner_Authorization_Steps_v2.pdf\">here</a>. To activate Linkedin.com please submit your <strong>Company_ID</strong> and <strong>Contract_ID</strong> in the form below. Your integration with Linkedin.com will then be activated immediately. </p>",
  "feed_url": null,
  "contract_credentials": [
    {
      "name": "Company_ID",
      "label": "Company ID",
      "sort": "10",
      "description": "Company ID on Linkedin (found in the URL of the company page, e.g. linkedin.com/company/201687)."
    },
    {
      "name": "Contract_ID",
      "label": "Contract ID",
      "sort": "20",
      "description": "Unique ID of the LinkedIn Recruiter contract to which the job will be posted."
    }
  ],
  "contract_facets": [],
  "posting_requirements": [
    {
      "name": "countryCode",
      "label": "Country code",
      "sort": "10",
      "required": true,
      "type": "SELECT",
      "options": [
        {
          "default": "0",
          "key": "ad",
          "label": "Andorra",
          "labels": {
            "default": "Andorra"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "ae",
          "label": "United Arab Emirates",
          "labels": {
            "default": "United Arab Emirates"
          },
          "sort": "20"
        },
        {
          "default": "0",
          "key": "af",
          "label": "Afghanistan",
          "labels": {
            "default": "Afghanistan"
          },
          "sort": "30"
        },
        {
          "default": "0",
          "key": "ag",
          "label": "Antigua and Barbuda",
          "labels": {
            "default": "Antigua and Barbuda"
          },
          "sort": "40"
        },
        {
          "default": "0",
          "key": "ai",
          "label": "Anguilla",
          "labels": {
            "default": "Anguilla"
          },
          "sort": "50"
        },
        {
          "default": "0",
          "key": "al",
          "label": "Albania",
          "labels": {
            "default": "Albania"
          },
          "sort": "60"
        },
        {
          "default": "0",
          "key": "am",
          "label": "Armenia",
          "labels": {
            "default": "Armenia"
          },
          "sort": "70"
        },
        {
          "default": "0",
          "key": "an",
          "label": "Netherlands Antilles",
          "labels": {
            "default": "Netherlands Antilles"
          },
          "sort": "80"
        },
        {
          "default": "0",
          "key": "ao",
          "label": "Angola",
          "labels": {
            "default": "Angola"
          },
          "sort": "90"
        },
        {
          "default": "0",
          "key": "aq",
          "label": "Antarctica",
          "labels": {
            "default": "Antarctica"
          },
          "sort": "100"
        },
        {
          "default": "0",
          "key": "ar",
          "label": "Argentina",
          "labels": {
            "default": "Argentina"
          },
          "sort": "110"
        },
        {
          "default": "0",
          "key": "as",
          "label": "American Samoa",
          "labels": {
            "default": "American Samoa"
          },
          "sort": "120"
        },
        {
          "default": "0",
          "key": "at",
          "label": "Austria",
          "labels": {
            "default": "Austria"
          },
          "sort": "130"
        },
        {
          "default": "0",
          "key": "au",
          "label": "Australia",
          "labels": {
            "default": "Australia"
          },
          "sort": "140"
        },
        {
          "default": "0",
          "key": "aw",
          "label": "Aruba",
          "labels": {
            "default": "Aruba"
          },
          "sort": "150"
        },
        {
          "default": "0",
          "key": "ax",
          "label": "Aland Islands",
          "labels": {
            "default": "Aland Islands"
          },
          "sort": "160"
        },
        {
          "default": "0",
          "key": "az",
          "label": "Azerbaijan",
          "labels": {
            "default": "Azerbaijan"
          },
          "sort": "170"
        },
        {
          "default": "0",
          "key": "ba",
          "label": "Bosnia and Herzegovina",
          "labels": {
            "default": "Bosnia and Herzegovina"
          },
          "sort": "180"
        },
        {
          "default": "0",
          "key": "bb",
          "label": "Barbados",
          "labels": {
            "default": "Barbados"
          },
          "sort": "190"
        },
        {
          "default": "0",
          "key": "bd",
          "label": "Bangladesh",
          "labels": {
            "default": "Bangladesh"
          },
          "sort": "200"
        },
        {
          "default": "0",
          "key": "be",
          "label": "Belgium",
          "labels": {
            "default": "Belgium"
          },
          "sort": "210"
        },
        {
          "default": "0",
          "key": "bf",
          "label": "Burkina Faso",
          "labels": {
            "default": "Burkina Faso"
          },
          "sort": "220"
        },
        {
          "default": "0",
          "key": "bg",
          "label": "Bulgaria",
          "labels": {
            "default": "Bulgaria"
          },
          "sort": "230"
        },
        {
          "default": "0",
          "key": "bh",
          "label": "Bahrain",
          "labels": {
            "default": "Bahrain"
          },
          "sort": "240"
        },
        {
          "default": "0",
          "key": "bi",
          "label": "Burundi",
          "labels": {
            "default": "Burundi"
          },
          "sort": "250"
        },
        {
          "default": "0",
          "key": "bj",
          "label": "Benin",
          "labels": {
            "default": "Benin"
          },
          "sort": "260"
        },
        {
          "default": "0",
          "key": "bm",
          "label": "Bermuda",
          "labels": {
            "default": "Bermuda"
          },
          "sort": "270"
        },
        {
          "default": "0",
          "key": "bn",
          "label": "Brunei Darussalam",
          "labels": {
            "default": "Brunei Darussalam"
          },
          "sort": "280"
        },
        {
          "default": "0",
          "key": "bo",
          "label": "Bolivia",
          "labels": {
            "default": "Bolivia"
          },
          "sort": "290"
        },
        {
          "default": "0",
          "key": "br",
          "label": "Brazil",
          "labels": {
            "default": "Brazil"
          },
          "sort": "300"
        },
        {
          "default": "0",
          "key": "bs",
          "label": "Bahamas",
          "labels": {
            "default": "Bahamas"
          },
          "sort": "310"
        },
        {
          "default": "0",
          "key": "bt",
          "label": "Bhutan",
          "labels": {
            "default": "Bhutan"
          },
          "sort": "320"
        },
        {
          "default": "0",
          "key": "bv",
          "label": "Bouvet Island",
          "labels": {
            "default": "Bouvet Island"
          },
          "sort": "330"
        },
        {
          "default": "0",
          "key": "bw",
          "label": "Botswana",
          "labels": {
            "default": "Botswana"
          },
          "sort": "340"
        },
        {
          "default": "0",
          "key": "by",
          "label": "Belarus",
          "labels": {
            "default": "Belarus"
          },
          "sort": "350"
        },
        {
          "default": "0",
          "key": "bz",
          "label": "Belize",
          "labels": {
            "default": "Belize"
          },
          "sort": "360"
        },
        {
          "default": "0",
          "key": "ca",
          "label": "Canada",
          "labels": {
            "default": "Canada"
          },
          "sort": "370"
        },
        {
          "default": "0",
          "key": "cb",
          "label": "Caribbean Nations",
          "labels": {
            "default": "Caribbean Nations"
          },
          "sort": "380"
        },
        {
          "default": "0",
          "key": "cc",
          "label": "Cocos (Keeling) Islands",
          "labels": {
            "default": "Cocos (Keeling) Islands"
          },
          "sort": "390"
        },
        {
          "default": "0",
          "key": "cd",
          "label": "Democratic Republic of the Congo",
          "labels": {
            "default": "Democratic Republic of the Congo"
          },
          "sort": "400"
        },
        {
          "default": "0",
          "key": "cf",
          "label": "Central African Republic",
          "labels": {
            "default": "Central African Republic"
          },
          "sort": "410"
        },
        {
          "default": "0",
          "key": "cg",
          "label": "Congo",
          "labels": {
            "default": "Congo"
          },
          "sort": "420"
        },
        {
          "default": "0",
          "key": "ch",
          "label": "Switzerland",
          "labels": {
            "default": "Switzerland"
          },
          "sort": "430"
        },
        {
          "default": "0",
          "key": "ci",
          "label": "Cote D'Ivoire (Ivory Coast)",
          "labels": {
            "default": "Cote D'Ivoire (Ivory Coast)"
          },
          "sort": "440"
        },
        {
          "default": "0",
          "key": "ck",
          "label": "Cook Islands",
          "labels": {
            "default": "Cook Islands"
          },
          "sort": "450"
        },
        {
          "default": "0",
          "key": "cl",
          "label": "Chile",
          "labels": {
            "default": "Chile"
          },
          "sort": "460"
        },
        {
          "default": "0",
          "key": "cm",
          "label": "Cameroon",
          "labels": {
            "default": "Cameroon"
          },
          "sort": "470"
        },
        {
          "default": "0",
          "key": "cn",
          "label": "China",
          "labels": {
            "default": "China"
          },
          "sort": "480"
        },
        {
          "default": "0",
          "key": "co",
          "label": "Colombia",
          "labels": {
            "default": "Colombia"
          },
          "sort": "490"
        },
        {
          "default": "0",
          "key": "cr",
          "label": "Costa Rica",
          "labels": {
            "default": "Costa Rica"
          },
          "sort": "500"
        },
        {
          "default": "0",
          "key": "cs",
          "label": "Serbia and Montenegro",
          "labels": {
            "default": "Serbia and Montenegro"
          },
          "sort": "510"
        },
        {
          "default": "0",
          "key": "cu",
          "label": "Cuba",
          "labels": {
            "default": "Cuba"
          },
          "sort": "520"
        },
        {
          "default": "0",
          "key": "cv",
          "label": "Cape Verde",
          "labels": {
            "default": "Cape Verde"
          },
          "sort": "530"
        },
        {
          "default": "0",
          "key": "cx",
          "label": "Christmas Island",
          "labels": {
            "default": "Christmas Island"
          },
          "sort": "540"
        },
        {
          "default": "0",
          "key": "cy",
          "label": "Cyprus",
          "labels": {
            "default": "Cyprus"
          },
          "sort": "550"
        },
        {
          "default": "0",
          "key": "cz",
          "label": "Czech Republic",
          "labels": {
            "default": "Czech Republic"
          },
          "sort": "560"
        },
        {
          "default": "0",
          "key": "de",
          "label": "Germany",
          "labels": {
            "default": "Germany"
          },
          "sort": "570"
        },
        {
          "default": "0",
          "key": "dj",
          "label": "Djibouti",
          "labels": {
            "default": "Djibouti"
          },
          "sort": "580"
        },
        {
          "default": "0",
          "key": "dk",
          "label": "Denmark",
          "labels": {
            "default": "Denmark"
          },
          "sort": "590"
        },
        {
          "default": "0",
          "key": "dm",
          "label": "Dominica",
          "labels": {
            "default": "Dominica"
          },
          "sort": "600"
        },
        {
          "default": "0",
          "key": "do",
          "label": "Dominican Republic",
          "labels": {
            "default": "Dominican Republic"
          },
          "sort": "610"
        },
        {
          "default": "0",
          "key": "dz",
          "label": "Algeria",
          "labels": {
            "default": "Algeria"
          },
          "sort": "620"
        },
        {
          "default": "0",
          "key": "ec",
          "label": "Ecuador",
          "labels": {
            "default": "Ecuador"
          },
          "sort": "630"
        },
        {
          "default": "0",
          "key": "ee",
          "label": "Estonia",
          "labels": {
            "default": "Estonia"
          },
          "sort": "640"
        },
        {
          "default": "0",
          "key": "eg",
          "label": "Egypt",
          "labels": {
            "default": "Egypt"
          },
          "sort": "650"
        },
        {
          "default": "0",
          "key": "eh",
          "label": "Western Sahara",
          "labels": {
            "default": "Western Sahara"
          },
          "sort": "660"
        },
        {
          "default": "0",
          "key": "er",
          "label": "Eritrea",
          "labels": {
            "default": "Eritrea"
          },
          "sort": "670"
        },
        {
          "default": "0",
          "key": "es",
          "label": "Spain",
          "labels": {
            "default": "Spain"
          },
          "sort": "680"
        },
        {
          "default": "0",
          "key": "et",
          "label": "Ethiopia",
          "labels": {
            "default": "Ethiopia"
          },
          "sort": "690"
        },
        {
          "default": "0",
          "key": "fi",
          "label": "Finland",
          "labels": {
            "default": "Finland"
          },
          "sort": "700"
        },
        {
          "default": "0",
          "key": "fj",
          "label": "Fiji",
          "labels": {
            "default": "Fiji"
          },
          "sort": "710"
        },
        {
          "default": "0",
          "key": "fk",
          "label": "Falkland Islands (Malvinas)",
          "labels": {
            "default": "Falkland Islands (Malvinas)"
          },
          "sort": "720"
        },
        {
          "default": "0",
          "key": "fm",
          "label": "Federated States of Micronesia",
          "labels": {
            "default": "Federated States of Micronesia"
          },
          "sort": "730"
        },
        {
          "default": "0",
          "key": "fo",
          "label": "Faroe Islands",
          "labels": {
            "default": "Faroe Islands"
          },
          "sort": "740"
        },
        {
          "default": "0",
          "key": "fr",
          "label": "France",
          "labels": {
            "default": "France"
          },
          "sort": "750"
        },
        {
          "default": "0",
          "key": "fx",
          "label": "France, Metropolitan",
          "labels": {
            "default": "France, Metropolitan"
          },
          "sort": "760"
        },
        {
          "default": "0",
          "key": "ga",
          "label": "Gabon",
          "labels": {
            "default": "Gabon"
          },
          "sort": "770"
        },
        {
          "default": "0",
          "key": "gb",
          "label": "United Kingdom",
          "labels": {
            "default": "United Kingdom"
          },
          "sort": "780"
        },
        {
          "default": "0",
          "key": "gd",
          "label": "Grenada",
          "labels": {
            "default": "Grenada"
          },
          "sort": "790"
        },
        {
          "default": "0",
          "key": "ge",
          "label": "Georgia",
          "labels": {
            "default": "Georgia"
          },
          "sort": "800"
        },
        {
          "default": "0",
          "key": "gf",
          "label": "French Guiana",
          "labels": {
            "default": "French Guiana"
          },
          "sort": "810"
        },
        {
          "default": "0",
          "key": "gh",
          "label": "Ghana",
          "labels": {
            "default": "Ghana"
          },
          "sort": "820"
        },
        {
          "default": "0",
          "key": "gi",
          "label": "Gibraltar",
          "labels": {
            "default": "Gibraltar"
          },
          "sort": "830"
        },
        {
          "default": "0",
          "key": "gl",
          "label": "Greenland",
          "labels": {
            "default": "Greenland"
          },
          "sort": "840"
        },
        {
          "default": "0",
          "key": "gm",
          "label": "Gambia",
          "labels": {
            "default": "Gambia"
          },
          "sort": "850"
        },
        {
          "default": "0",
          "key": "gn",
          "label": "Guinea",
          "labels": {
            "default": "Guinea"
          },
          "sort": "860"
        },
        {
          "default": "0",
          "key": "gp",
          "label": "Guadeloupe",
          "labels": {
            "default": "Guadeloupe"
          },
          "sort": "870"
        },
        {
          "default": "0",
          "key": "gq",
          "label": "Equatorial Guinea",
          "labels": {
            "default": "Equatorial Guinea"
          },
          "sort": "880"
        },
        {
          "default": "0",
          "key": "gr",
          "label": "Greece",
          "labels": {
            "default": "Greece"
          },
          "sort": "890"
        },
        {
          "default": "0",
          "key": "gs",
          "label": "S. Georgia and S. Sandwich Islands",
          "labels": {
            "default": "S. Georgia and S. Sandwich Islands"
          },
          "sort": "900"
        },
        {
          "default": "0",
          "key": "gt",
          "label": "Guatemala",
          "labels": {
            "default": "Guatemala"
          },
          "sort": "910"
        },
        {
          "default": "0",
          "key": "gu",
          "label": "Guam",
          "labels": {
            "default": "Guam"
          },
          "sort": "920"
        },
        {
          "default": "0",
          "key": "gw",
          "label": "Guinea-Bissau",
          "labels": {
            "default": "Guinea-Bissau"
          },
          "sort": "930"
        },
        {
          "default": "0",
          "key": "gy",
          "label": "Guyana",
          "labels": {
            "default": "Guyana"
          },
          "sort": "940"
        },
        {
          "default": "0",
          "key": "hk",
          "label": "Hong Kong",
          "labels": {
            "default": "Hong Kong"
          },
          "sort": "950"
        },
        {
          "default": "0",
          "key": "hm",
          "label": "Heard Island and McDonald Islands",
          "labels": {
            "default": "Heard Island and McDonald Islands"
          },
          "sort": "960"
        },
        {
          "default": "0",
          "key": "hn",
          "label": "Honduras",
          "labels": {
            "default": "Honduras"
          },
          "sort": "970"
        },
        {
          "default": "0",
          "key": "hr",
          "label": "Croatia",
          "labels": {
            "default": "Croatia"
          },
          "sort": "980"
        },
        {
          "default": "0",
          "key": "ht",
          "label": "Haiti",
          "labels": {
            "default": "Haiti"
          },
          "sort": "990"
        },
        {
          "default": "0",
          "key": "hu",
          "label": "Hungary",
          "labels": {
            "default": "Hungary"
          },
          "sort": "1000"
        },
        {
          "default": "0",
          "key": "id",
          "label": "Indonesia",
          "labels": {
            "default": "Indonesia"
          },
          "sort": "1010"
        },
        {
          "default": "0",
          "key": "ie",
          "label": "Ireland",
          "labels": {
            "default": "Ireland"
          },
          "sort": "1020"
        },
        {
          "default": "0",
          "key": "il",
          "label": "Israel",
          "labels": {
            "default": "Israel"
          },
          "sort": "1030"
        },
        {
          "default": "0",
          "key": "in",
          "label": "India",
          "labels": {
            "default": "India"
          },
          "sort": "1040"
        },
        {
          "default": "0",
          "key": "io",
          "label": "British Indian Ocean Territory",
          "labels": {
            "default": "British Indian Ocean Territory"
          },
          "sort": "1050"
        },
        {
          "default": "0",
          "key": "iq",
          "label": "Iraq",
          "labels": {
            "default": "Iraq"
          },
          "sort": "1060"
        },
        {
          "default": "0",
          "key": "ir",
          "label": "Iran",
          "labels": {
            "default": "Iran"
          },
          "sort": "1070"
        },
        {
          "default": "0",
          "key": "is",
          "label": "Iceland",
          "labels": {
            "default": "Iceland"
          },
          "sort": "1080"
        },
        {
          "default": "0",
          "key": "it",
          "label": "Italy",
          "labels": {
            "default": "Italy"
          },
          "sort": "1090"
        },
        {
          "default": "0",
          "key": "jm",
          "label": "Jamaica",
          "labels": {
            "default": "Jamaica"
          },
          "sort": "1100"
        },
        {
          "default": "0",
          "key": "jo",
          "label": "Jordan",
          "labels": {
            "default": "Jordan"
          },
          "sort": "1110"
        },
        {
          "default": "0",
          "key": "jp",
          "label": "Japan",
          "labels": {
            "default": "Japan"
          },
          "sort": "1120"
        },
        {
          "default": "0",
          "key": "ke",
          "label": "Kenya",
          "labels": {
            "default": "Kenya"
          },
          "sort": "1130"
        },
        {
          "default": "0",
          "key": "kg",
          "label": "Kyrgyzstan",
          "labels": {
            "default": "Kyrgyzstan"
          },
          "sort": "1140"
        },
        {
          "default": "0",
          "key": "kh",
          "label": "Cambodia",
          "labels": {
            "default": "Cambodia"
          },
          "sort": "1150"
        },
        {
          "default": "0",
          "key": "ki",
          "label": "Kiribati",
          "labels": {
            "default": "Kiribati"
          },
          "sort": "1160"
        },
        {
          "default": "0",
          "key": "km",
          "label": "Comoros",
          "labels": {
            "default": "Comoros"
          },
          "sort": "1170"
        },
        {
          "default": "0",
          "key": "kn",
          "label": "Saint Kitts and Nevis",
          "labels": {
            "default": "Saint Kitts and Nevis"
          },
          "sort": "1180"
        },
        {
          "default": "0",
          "key": "kp",
          "label": "Korea (North)",
          "labels": {
            "default": "Korea (North)"
          },
          "sort": "1190"
        },
        {
          "default": "0",
          "key": "kr",
          "label": "Korea",
          "labels": {
            "default": "Korea"
          },
          "sort": "1200"
        },
        {
          "default": "0",
          "key": "kw",
          "label": "Kuwait",
          "labels": {
            "default": "Kuwait"
          },
          "sort": "1210"
        },
        {
          "default": "0",
          "key": "ky",
          "label": "Cayman Islands",
          "labels": {
            "default": "Cayman Islands"
          },
          "sort": "1220"
        },
        {
          "default": "0",
          "key": "kz",
          "label": "Kazakhstan",
          "labels": {
            "default": "Kazakhstan"
          },
          "sort": "1230"
        },
        {
          "default": "0",
          "key": "la",
          "label": "Laos",
          "labels": {
            "default": "Laos"
          },
          "sort": "1240"
        },
        {
          "default": "0",
          "key": "lb",
          "label": "Lebanon",
          "labels": {
            "default": "Lebanon"
          },
          "sort": "1250"
        },
        {
          "default": "0",
          "key": "lc",
          "label": "Saint Lucia",
          "labels": {
            "default": "Saint Lucia"
          },
          "sort": "1260"
        },
        {
          "default": "0",
          "key": "li",
          "label": "Liechtenstein",
          "labels": {
            "default": "Liechtenstein"
          },
          "sort": "1270"
        },
        {
          "default": "0",
          "key": "lk",
          "label": "Sri Lanka",
          "labels": {
            "default": "Sri Lanka"
          },
          "sort": "1280"
        },
        {
          "default": "0",
          "key": "lr",
          "label": "Liberia",
          "labels": {
            "default": "Liberia"
          },
          "sort": "1290"
        },
        {
          "default": "0",
          "key": "ls",
          "label": "Lesotho",
          "labels": {
            "default": "Lesotho"
          },
          "sort": "1300"
        },
        {
          "default": "0",
          "key": "lt",
          "label": "Lithuania",
          "labels": {
            "default": "Lithuania"
          },
          "sort": "1310"
        },
        {
          "default": "0",
          "key": "lu",
          "label": "Luxembourg",
          "labels": {
            "default": "Luxembourg"
          },
          "sort": "1320"
        },
        {
          "default": "0",
          "key": "lv",
          "label": "Latvia",
          "labels": {
            "default": "Latvia"
          },
          "sort": "1330"
        },
        {
          "default": "0",
          "key": "ly",
          "label": "Libya",
          "labels": {
            "default": "Libya"
          },
          "sort": "1340"
        },
        {
          "default": "0",
          "key": "ma",
          "label": "Morocco",
          "labels": {
            "default": "Morocco"
          },
          "sort": "1350"
        },
        {
          "default": "0",
          "key": "mc",
          "label": "Monaco",
          "labels": {
            "default": "Monaco"
          },
          "sort": "1360"
        },
        {
          "default": "0",
          "key": "md",
          "label": "Moldova",
          "labels": {
            "default": "Moldova"
          },
          "sort": "1370"
        },
        {
          "default": "0",
          "key": "mg",
          "label": "Madagascar",
          "labels": {
            "default": "Madagascar"
          },
          "sort": "1380"
        },
        {
          "default": "0",
          "key": "mh",
          "label": "Marshall Islands",
          "labels": {
            "default": "Marshall Islands"
          },
          "sort": "1390"
        },
        {
          "default": "0",
          "key": "mk",
          "label": "Macedonia",
          "labels": {
            "default": "Macedonia"
          },
          "sort": "1400"
        },
        {
          "default": "0",
          "key": "ml",
          "label": "Mali",
          "labels": {
            "default": "Mali"
          },
          "sort": "1410"
        },
        {
          "default": "0",
          "key": "mm",
          "label": "Myanmar",
          "labels": {
            "default": "Myanmar"
          },
          "sort": "1420"
        },
        {
          "default": "0",
          "key": "mn",
          "label": "Mongolia",
          "labels": {
            "default": "Mongolia"
          },
          "sort": "1430"
        },
        {
          "default": "0",
          "key": "mo",
          "label": "Macao",
          "labels": {
            "default": "Macao"
          },
          "sort": "1440"
        },
        {
          "default": "0",
          "key": "mp",
          "label": "Northern Mariana Islands",
          "labels": {
            "default": "Northern Mariana Islands"
          },
          "sort": "1450"
        },
        {
          "default": "0",
          "key": "mq",
          "label": "Martinique",
          "labels": {
            "default": "Martinique"
          },
          "sort": "1460"
        },
        {
          "default": "0",
          "key": "mr",
          "label": "Mauritania",
          "labels": {
            "default": "Mauritania"
          },
          "sort": "1470"
        },
        {
          "default": "0",
          "key": "ms",
          "label": "Montserrat",
          "labels": {
            "default": "Montserrat"
          },
          "sort": "1480"
        },
        {
          "default": "0",
          "key": "mt",
          "label": "Malta",
          "labels": {
            "default": "Malta"
          },
          "sort": "1490"
        },
        {
          "default": "0",
          "key": "mu",
          "label": "Mauritius",
          "labels": {
            "default": "Mauritius"
          },
          "sort": "1500"
        },
        {
          "default": "0",
          "key": "mv",
          "label": "Maldives",
          "labels": {
            "default": "Maldives"
          },
          "sort": "1510"
        },
        {
          "default": "0",
          "key": "mw",
          "label": "Malawi",
          "labels": {
            "default": "Malawi"
          },
          "sort": "1520"
        },
        {
          "default": "0",
          "key": "mx",
          "label": "Mexico",
          "labels": {
            "default": "Mexico"
          },
          "sort": "1530"
        },
        {
          "default": "0",
          "key": "my",
          "label": "Malaysia",
          "labels": {
            "default": "Malaysia"
          },
          "sort": "1540"
        },
        {
          "default": "0",
          "key": "mz",
          "label": "Mozambique",
          "labels": {
            "default": "Mozambique"
          },
          "sort": "1550"
        },
        {
          "default": "0",
          "key": "na",
          "label": "Namibia",
          "labels": {
            "default": "Namibia"
          },
          "sort": "1560"
        },
        {
          "default": "0",
          "key": "nc",
          "label": "New Caledonia",
          "labels": {
            "default": "New Caledonia"
          },
          "sort": "1570"
        },
        {
          "default": "0",
          "key": "ne",
          "label": "Niger",
          "labels": {
            "default": "Niger"
          },
          "sort": "1580"
        },
        {
          "default": "0",
          "key": "nf",
          "label": "Norfolk Island",
          "labels": {
            "default": "Norfolk Island"
          },
          "sort": "1590"
        },
        {
          "default": "0",
          "key": "ng",
          "label": "Nigeria",
          "labels": {
            "default": "Nigeria"
          },
          "sort": "1600"
        },
        {
          "default": "0",
          "key": "ni",
          "label": "Nicaragua",
          "labels": {
            "default": "Nicaragua"
          },
          "sort": "1610"
        },
        {
          "default": "0",
          "key": "nl",
          "label": "Netherlands",
          "labels": {
            "default": "Netherlands"
          },
          "sort": "1620"
        },
        {
          "default": "0",
          "key": "no",
          "label": "Norway",
          "labels": {
            "default": "Norway"
          },
          "sort": "1630"
        },
        {
          "default": "0",
          "key": "np",
          "label": "Nepal",
          "labels": {
            "default": "Nepal"
          },
          "sort": "1640"
        },
        {
          "default": "0",
          "key": "nr",
          "label": "Nauru",
          "labels": {
            "default": "Nauru"
          },
          "sort": "1650"
        },
        {
          "default": "0",
          "key": "nu",
          "label": "Niue",
          "labels": {
            "default": "Niue"
          },
          "sort": "1660"
        },
        {
          "default": "0",
          "key": "nz",
          "label": "New Zealand",
          "labels": {
            "default": "New Zealand"
          },
          "sort": "1670"
        },
        {
          "default": "0",
          "key": "om",
          "label": "Sultanate of Oman",
          "labels": {
            "default": "Sultanate of Oman"
          },
          "sort": "1680"
        },
        {
          "default": "0",
          "key": "oo",
          "label": "Other",
          "labels": {
            "default": "Other"
          },
          "sort": "1690"
        },
        {
          "default": "0",
          "key": "pa",
          "label": "Panama",
          "labels": {
            "default": "Panama"
          },
          "sort": "1700"
        },
        {
          "default": "0",
          "key": "pe",
          "label": "Peru",
          "labels": {
            "default": "Peru"
          },
          "sort": "1710"
        },
        {
          "default": "0",
          "key": "pf",
          "label": "French Polynesia",
          "labels": {
            "default": "French Polynesia"
          },
          "sort": "1720"
        },
        {
          "default": "0",
          "key": "pg",
          "label": "Papua New Guinea",
          "labels": {
            "default": "Papua New Guinea"
          },
          "sort": "1730"
        },
        {
          "default": "0",
          "key": "ph",
          "label": "Philippines",
          "labels": {
            "default": "Philippines"
          },
          "sort": "1740"
        },
        {
          "default": "0",
          "key": "pk",
          "label": "Pakistan",
          "labels": {
            "default": "Pakistan"
          },
          "sort": "1750"
        },
        {
          "default": "0",
          "key": "pl",
          "label": "Poland",
          "labels": {
            "default": "Poland"
          },
          "sort": "1760"
        },
        {
          "default": "0",
          "key": "pm",
          "label": "Saint Pierre and Miquelon",
          "labels": {
            "default": "Saint Pierre and Miquelon"
          },
          "sort": "1770"
        },
        {
          "default": "0",
          "key": "pn",
          "label": "Pitcairn",
          "labels": {
            "default": "Pitcairn"
          },
          "sort": "1780"
        },
        {
          "default": "0",
          "key": "pr",
          "label": "Puerto Rico",
          "labels": {
            "default": "Puerto Rico"
          },
          "sort": "1790"
        },
        {
          "default": "0",
          "key": "ps",
          "label": "Palestinian Territory",
          "labels": {
            "default": "Palestinian Territory"
          },
          "sort": "1800"
        },
        {
          "default": "0",
          "key": "pt",
          "label": "Portugal",
          "labels": {
            "default": "Portugal"
          },
          "sort": "1810"
        },
        {
          "default": "0",
          "key": "pw",
          "label": "Palau",
          "labels": {
            "default": "Palau"
          },
          "sort": "1820"
        },
        {
          "default": "0",
          "key": "py",
          "label": "Paraguay",
          "labels": {
            "default": "Paraguay"
          },
          "sort": "1830"
        },
        {
          "default": "0",
          "key": "qa",
          "label": "Qatar",
          "labels": {
            "default": "Qatar"
          },
          "sort": "1840"
        },
        {
          "default": "0",
          "key": "re",
          "label": "Reunion",
          "labels": {
            "default": "Reunion"
          },
          "sort": "1850"
        },
        {
          "default": "0",
          "key": "ro",
          "label": "Romania",
          "labels": {
            "default": "Romania"
          },
          "sort": "1860"
        },
        {
          "default": "0",
          "key": "ru",
          "label": "Russian Federation",
          "labels": {
            "default": "Russian Federation"
          },
          "sort": "1870"
        },
        {
          "default": "0",
          "key": "rw",
          "label": "Rwanda",
          "labels": {
            "default": "Rwanda"
          },
          "sort": "1880"
        },
        {
          "default": "0",
          "key": "sa",
          "label": "Saudi Arabia",
          "labels": {
            "default": "Saudi Arabia"
          },
          "sort": "1890"
        },
        {
          "default": "0",
          "key": "sb",
          "label": "Solomon Islands",
          "labels": {
            "default": "Solomon Islands"
          },
          "sort": "1900"
        },
        {
          "default": "0",
          "key": "sc",
          "label": "Seychelles",
          "labels": {
            "default": "Seychelles"
          },
          "sort": "1910"
        },
        {
          "default": "0",
          "key": "sd",
          "label": "Sudan",
          "labels": {
            "default": "Sudan"
          },
          "sort": "1920"
        },
        {
          "default": "0",
          "key": "se",
          "label": "Sweden",
          "labels": {
            "default": "Sweden"
          },
          "sort": "1930"
        },
        {
          "default": "0",
          "key": "sg",
          "label": "Singapore",
          "labels": {
            "default": "Singapore"
          },
          "sort": "1940"
        },
        {
          "default": "0",
          "key": "sh",
          "label": "Saint Helena",
          "labels": {
            "default": "Saint Helena"
          },
          "sort": "1950"
        },
        {
          "default": "0",
          "key": "si",
          "label": "Slovenia",
          "labels": {
            "default": "Slovenia"
          },
          "sort": "1960"
        },
        {
          "default": "0",
          "key": "sj",
          "label": "Svalbard and Jan Mayen",
          "labels": {
            "default": "Svalbard and Jan Mayen"
          },
          "sort": "1970"
        },
        {
          "default": "0",
          "key": "sk",
          "label": "Slovak Republic",
          "labels": {
            "default": "Slovak Republic"
          },
          "sort": "1980"
        },
        {
          "default": "0",
          "key": "sl",
          "label": "Sierra Leone",
          "labels": {
            "default": "Sierra Leone"
          },
          "sort": "1990"
        },
        {
          "default": "0",
          "key": "sm",
          "label": "San Marino",
          "labels": {
            "default": "San Marino"
          },
          "sort": "2000"
        },
        {
          "default": "0",
          "key": "sn",
          "label": "Senegal",
          "labels": {
            "default": "Senegal"
          },
          "sort": "2010"
        },
        {
          "default": "0",
          "key": "so",
          "label": "Somalia",
          "labels": {
            "default": "Somalia"
          },
          "sort": "2020"
        },
        {
          "default": "0",
          "key": "sr",
          "label": "Suriname",
          "labels": {
            "default": "Suriname"
          },
          "sort": "2030"
        },
        {
          "default": "0",
          "key": "st",
          "label": "Sao Tome and Principe",
          "labels": {
            "default": "Sao Tome and Principe"
          },
          "sort": "2040"
        },
        {
          "default": "0",
          "key": "sv",
          "label": "El Salvador",
          "labels": {
            "default": "El Salvador"
          },
          "sort": "2050"
        },
        {
          "default": "0",
          "key": "sy",
          "label": "Syria",
          "labels": {
            "default": "Syria"
          },
          "sort": "2060"
        },
        {
          "default": "0",
          "key": "sz",
          "label": "Swaziland",
          "labels": {
            "default": "Swaziland"
          },
          "sort": "2070"
        },
        {
          "default": "0",
          "key": "tc",
          "label": "Turks and Caicos Islands",
          "labels": {
            "default": "Turks and Caicos Islands"
          },
          "sort": "2080"
        },
        {
          "default": "0",
          "key": "td",
          "label": "Chad",
          "labels": {
            "default": "Chad"
          },
          "sort": "2090"
        },
        {
          "default": "0",
          "key": "tf",
          "label": "French Southern Territories",
          "labels": {
            "default": "French Southern Territories"
          },
          "sort": "2100"
        },
        {
          "default": "0",
          "key": "tg",
          "label": "Togo",
          "labels": {
            "default": "Togo"
          },
          "sort": "2110"
        },
        {
          "default": "0",
          "key": "th",
          "label": "Thailand",
          "labels": {
            "default": "Thailand"
          },
          "sort": "2120"
        },
        {
          "default": "0",
          "key": "tj",
          "label": "Tajikistan",
          "labels": {
            "default": "Tajikistan"
          },
          "sort": "2130"
        },
        {
          "default": "0",
          "key": "tk",
          "label": "Tokelau",
          "labels": {
            "default": "Tokelau"
          },
          "sort": "2140"
        },
        {
          "default": "0",
          "key": "tl",
          "label": "Timor-Leste",
          "labels": {
            "default": "Timor-Leste"
          },
          "sort": "2150"
        },
        {
          "default": "0",
          "key": "tm",
          "label": "Turkmenistan",
          "labels": {
            "default": "Turkmenistan"
          },
          "sort": "2160"
        },
        {
          "default": "0",
          "key": "tn",
          "label": "Tunisia",
          "labels": {
            "default": "Tunisia"
          },
          "sort": "2170"
        },
        {
          "default": "0",
          "key": "to",
          "label": "Tonga",
          "labels": {
            "default": "Tonga"
          },
          "sort": "2180"
        },
        {
          "default": "0",
          "key": "tp",
          "label": "East Timor",
          "labels": {
            "default": "East Timor"
          },
          "sort": "2190"
        },
        {
          "default": "0",
          "key": "tr",
          "label": "Turkey",
          "labels": {
            "default": "Turkey"
          },
          "sort": "2200"
        },
        {
          "default": "0",
          "key": "tt",
          "label": "Trinidad and Tobago",
          "labels": {
            "default": "Trinidad and Tobago"
          },
          "sort": "2210"
        },
        {
          "default": "0",
          "key": "tv",
          "label": "Tuvalu",
          "labels": {
            "default": "Tuvalu"
          },
          "sort": "2220"
        },
        {
          "default": "0",
          "key": "tw",
          "label": "Taiwan",
          "labels": {
            "default": "Taiwan"
          },
          "sort": "2230"
        },
        {
          "default": "0",
          "key": "tz",
          "label": "Tanzania",
          "labels": {
            "default": "Tanzania"
          },
          "sort": "2240"
        },
        {
          "default": "0",
          "key": "ua",
          "label": "Ukraine",
          "labels": {
            "default": "Ukraine"
          },
          "sort": "2250"
        },
        {
          "default": "0",
          "key": "ug",
          "label": "Uganda",
          "labels": {
            "default": "Uganda"
          },
          "sort": "2260"
        },
        {
          "default": "0",
          "key": "us",
          "label": "United States",
          "labels": {
            "default": "United States"
          },
          "sort": "2270"
        },
        {
          "default": "0",
          "key": "uy",
          "label": "Uruguay",
          "labels": {
            "default": "Uruguay"
          },
          "sort": "2280"
        },
        {
          "default": "0",
          "key": "uz",
          "label": "Uzbekistan",
          "labels": {
            "default": "Uzbekistan"
          },
          "sort": "2290"
        },
        {
          "default": "0",
          "key": "va",
          "label": "Vatican City State (Holy See)",
          "labels": {
            "default": "Vatican City State (Holy See)"
          },
          "sort": "2300"
        },
        {
          "default": "0",
          "key": "vc",
          "label": "Saint Vincent and the Grenadines",
          "labels": {
            "default": "Saint Vincent and the Grenadines"
          },
          "sort": "2310"
        },
        {
          "default": "0",
          "key": "ve",
          "label": "Venezuela",
          "labels": {
            "default": "Venezuela"
          },
          "sort": "2320"
        },
        {
          "default": "0",
          "key": "vg",
          "label": "Virgin Islands (British)",
          "labels": {
            "default": "Virgin Islands (British)"
          },
          "sort": "2330"
        },
        {
          "default": "0",
          "key": "vi",
          "label": "Virgin Islands (U.S.)",
          "labels": {
            "default": "Virgin Islands (U.S.)"
          },
          "sort": "2340"
        },
        {
          "default": "0",
          "key": "vn",
          "label": "Vietnam",
          "labels": {
            "default": "Vietnam"
          },
          "sort": "2350"
        },
        {
          "default": "0",
          "key": "vu",
          "label": "Vanuatu",
          "labels": {
            "default": "Vanuatu"
          },
          "sort": "2360"
        },
        {
          "default": "0",
          "key": "wf",
          "label": "Wallis and Futuna",
          "labels": {
            "default": "Wallis and Futuna"
          },
          "sort": "2370"
        },
        {
          "default": "0",
          "key": "ws",
          "label": "Samoa",
          "labels": {
            "default": "Samoa"
          },
          "sort": "2380"
        },
        {
          "default": "0",
          "key": "ye",
          "label": "Yemen",
          "labels": {
            "default": "Yemen"
          },
          "sort": "2390"
        },
        {
          "default": "0",
          "key": "yt",
          "label": "Mayotte",
          "labels": {
            "default": "Mayotte"
          },
          "sort": "2400"
        },
        {
          "default": "0",
          "key": "yu",
          "label": "Yugoslavia",
          "labels": {
            "default": "Yugoslavia"
          },
          "sort": "2410"
        },
        {
          "default": "0",
          "key": "za",
          "label": "South Africa",
          "labels": {
            "default": "South Africa"
          },
          "sort": "2420"
        },
        {
          "default": "0",
          "key": "zm",
          "label": "Zambia",
          "labels": {
            "default": "Zambia"
          },
          "sort": "2430"
        },
        {
          "default": "0",
          "key": "zw",
          "label": "Zimbabwe",
          "labels": {
            "default": "Zimbabwe"
          },
          "sort": "2440"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "postalCode",
      "label": "Postal Code",
      "sort": "20",
      "required": true,
      "type": "TEXT",
      "options": [],
      "rules": [
        {
          "rule": "maxlength",
          "data": "10"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "categories",
      "label": "Categories",
      "sort": "40",
      "required": true,
      "type": "MULTIPLE",
      "options": [
        {
          "default": "0",
          "key": "acct",
          "label": "Accounting / Auditing",
          "labels": {
            "default": "Accounting / Auditing"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "adm",
          "label": "Administrative",
          "labels": {
            "default": "Administrative"
          },
          "sort": "20"
        },
        {
          "default": "0",
          "key": "advr",
          "label": "Advertising",
          "labels": {
            "default": "Advertising"
          },
          "sort": "30"
        },
        {
          "default": "0",
          "key": "anls",
          "label": "Analyst",
          "labels": {
            "default": "Analyst"
          },
          "sort": "40"
        },
        {
          "default": "0",
          "key": "art",
          "label": "Art / Creative",
          "labels": {
            "default": "Art / Creative"
          },
          "sort": "50"
        },
        {
          "default": "0",
          "key": "bd",
          "label": "Business Development",
          "labels": {
            "default": "Business Development"
          },
          "sort": "60"
        },
        {
          "default": "0",
          "key": "cnsl",
          "label": "Consulting",
          "labels": {
            "default": "Consulting"
          },
          "sort": "70"
        },
        {
          "default": "0",
          "key": "cust",
          "label": "Customer Service",
          "labels": {
            "default": "Customer Service"
          },
          "sort": "80"
        },
        {
          "default": "0",
          "key": "dist",
          "label": "Distribution",
          "labels": {
            "default": "Distribution"
          },
          "sort": "90"
        },
        {
          "default": "0",
          "key": "dsgn",
          "label": "Design",
          "labels": {
            "default": "Design"
          },
          "sort": "100"
        },
        {
          "default": "0",
          "key": "edu",
          "label": "Education",
          "labels": {
            "default": "Education"
          },
          "sort": "110"
        },
        {
          "default": "0",
          "key": "eng",
          "label": "Engineering",
          "labels": {
            "default": "Engineering"
          },
          "sort": "120"
        },
        {
          "default": "0",
          "key": "fin",
          "label": "Finance",
          "labels": {
            "default": "Finance"
          },
          "sort": "130"
        },
        {
          "default": "0",
          "key": "genb",
          "label": "General Business",
          "labels": {
            "default": "General Business"
          },
          "sort": "140"
        },
        {
          "default": "0",
          "key": "hcpr",
          "label": "HealthCare Provider",
          "labels": {
            "default": "HealthCare Provider"
          },
          "sort": "150"
        },
        {
          "default": "0",
          "key": "hr",
          "label": "Human Resources",
          "labels": {
            "default": "Human Resources"
          },
          "sort": "160"
        },
        {
          "default": "0",
          "key": "it",
          "label": "Information Technology",
          "labels": {
            "default": "Information Technology"
          },
          "sort": "170"
        },
        {
          "default": "0",
          "key": "lgl",
          "label": "Legal",
          "labels": {
            "default": "Legal"
          },
          "sort": "180"
        },
        {
          "default": "0",
          "key": "mgmt",
          "label": "Management",
          "labels": {
            "default": "Management"
          },
          "sort": "190"
        },
        {
          "default": "0",
          "key": "mnfc",
          "label": "Manufacturing",
          "labels": {
            "default": "Manufacturing"
          },
          "sort": "200"
        },
        {
          "default": "0",
          "key": "mrkt",
          "label": "Marketing",
          "labels": {
            "default": "Marketing"
          },
          "sort": "210"
        },
        {
          "default": "0",
          "key": "othr",
          "label": "Other",
          "labels": {
            "default": "Other"
          },
          "sort": "220"
        },
        {
          "default": "0",
          "key": "pr",
          "label": "Public Relations",
          "labels": {
            "default": "Public Relations"
          },
          "sort": "230"
        },
        {
          "default": "0",
          "key": "prch",
          "label": "Purchasing",
          "labels": {
            "default": "Purchasing"
          },
          "sort": "240"
        },
        {
          "default": "0",
          "key": "prdm",
          "label": "Product Management",
          "labels": {
            "default": "Product Management"
          },
          "sort": "250"
        },
        {
          "default": "0",
          "key": "prjm",
          "label": "Project Management",
          "labels": {
            "default": "Project Management"
          },
          "sort": "260"
        },
        {
          "default": "0",
          "key": "prod",
          "label": "Production",
          "labels": {
            "default": "Production"
          },
          "sort": "270"
        },
        {
          "default": "0",
          "key": "qa",
          "label": "QualityAssurance",
          "labels": {
            "default": "QualityAssurance"
          },
          "sort": "280"
        },
        {
          "default": "0",
          "key": "rsch",
          "label": "Research",
          "labels": {
            "default": "Research"
          },
          "sort": "290"
        },
        {
          "default": "0",
          "key": "sale",
          "label": "Sales",
          "labels": {
            "default": "Sales"
          },
          "sort": "300"
        },
        {
          "default": "0",
          "key": "sci",
          "label": "Science",
          "labels": {
            "default": "Science"
          },
          "sort": "310"
        },
        {
          "default": "0",
          "key": "stra",
          "label": "Strategy / Planning",
          "labels": {
            "default": "Strategy / Planning"
          },
          "sort": "320"
        },
        {
          "default": "0",
          "key": "supl",
          "label": "Supply Chain",
          "labels": {
            "default": "Supply Chain"
          },
          "sort": "330"
        },
        {
          "default": "0",
          "key": "trng",
          "label": "Training",
          "labels": {
            "default": "Training"
          },
          "sort": "340"
        },
        {
          "default": "0",
          "key": "wrt",
          "label": "Writing / Editing",
          "labels": {
            "default": "Writing / Editing"
          },
          "sort": "350"
        }
      ],
      "rules": [
        {
          "rule": "maxitems",
          "data": "3"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "industries",
      "label": "Industry",
      "sort": "50",
      "required": true,
      "type": "MULTIPLE",
      "options": [
        {
          "default": "0",
          "key": "47",
          "label": "Accounting",
          "labels": {
            "default": "Accounting"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "94",
          "label": "Airlines/Aviation",
          "labels": {
            "default": "Airlines/Aviation"
          },
          "sort": "20"
        },
        {
          "default": "0",
          "key": "120",
          "label": "Alternative Dispute Resolution",
          "labels": {
            "default": "Alternative Dispute Resolution"
          },
          "sort": "30"
        },
        {
          "default": "0",
          "key": "125",
          "label": "Alternative Medicine",
          "labels": {
            "default": "Alternative Medicine"
          },
          "sort": "40"
        },
        {
          "default": "0",
          "key": "127",
          "label": "Animation",
          "labels": {
            "default": "Animation"
          },
          "sort": "50"
        },
        {
          "default": "0",
          "key": "19",
          "label": "Apparel & Fashion",
          "labels": {
            "default": "Apparel & Fashion"
          },
          "sort": "60"
        },
        {
          "default": "0",
          "key": "50",
          "label": "Architecture & Planning",
          "labels": {
            "default": "Architecture & Planning"
          },
          "sort": "70"
        },
        {
          "default": "0",
          "key": "111",
          "label": "Arts and Crafts",
          "labels": {
            "default": "Arts and Crafts"
          },
          "sort": "80"
        },
        {
          "default": "0",
          "key": "53",
          "label": "Automotive",
          "labels": {
            "default": "Automotive"
          },
          "sort": "90"
        },
        {
          "default": "0",
          "key": "52",
          "label": "Aviation & Aerospace",
          "labels": {
            "default": "Aviation & Aerospace"
          },
          "sort": "100"
        },
        {
          "default": "0",
          "key": "41",
          "label": "Banking",
          "labels": {
            "default": "Banking"
          },
          "sort": "110"
        },
        {
          "default": "0",
          "key": "12",
          "label": "Biotechnology",
          "labels": {
            "default": "Biotechnology"
          },
          "sort": "120"
        },
        {
          "default": "0",
          "key": "36",
          "label": "Broadcast Media",
          "labels": {
            "default": "Broadcast Media"
          },
          "sort": "130"
        },
        {
          "default": "0",
          "key": "49",
          "label": "Building Materials",
          "labels": {
            "default": "Building Materials"
          },
          "sort": "140"
        },
        {
          "default": "0",
          "key": "138",
          "label": "Business Supplies and Equipment",
          "labels": {
            "default": "Business Supplies and Equipment"
          },
          "sort": "150"
        },
        {
          "default": "0",
          "key": "129",
          "label": "Capital Markets",
          "labels": {
            "default": "Capital Markets"
          },
          "sort": "160"
        },
        {
          "default": "0",
          "key": "54",
          "label": "Chemicals",
          "labels": {
            "default": "Chemicals"
          },
          "sort": "170"
        },
        {
          "default": "0",
          "key": "90",
          "label": "Civic & Social Organization",
          "labels": {
            "default": "Civic & Social Organization"
          },
          "sort": "180"
        },
        {
          "default": "0",
          "key": "51",
          "label": "Civil Engineering",
          "labels": {
            "default": "Civil Engineering"
          },
          "sort": "190"
        },
        {
          "default": "0",
          "key": "128",
          "label": "Commercial Real Estate",
          "labels": {
            "default": "Commercial Real Estate"
          },
          "sort": "200"
        },
        {
          "default": "0",
          "key": "118",
          "label": "Computer & Network Security",
          "labels": {
            "default": "Computer & Network Security"
          },
          "sort": "210"
        },
        {
          "default": "0",
          "key": "109",
          "label": "Computer Games",
          "labels": {
            "default": "Computer Games"
          },
          "sort": "220"
        },
        {
          "default": "0",
          "key": "3",
          "label": "Computer Hardware",
          "labels": {
            "default": "Computer Hardware"
          },
          "sort": "230"
        },
        {
          "default": "0",
          "key": "5",
          "label": "Computer Networking",
          "labels": {
            "default": "Computer Networking"
          },
          "sort": "240"
        },
        {
          "default": "0",
          "key": "4",
          "label": "Computer Software",
          "labels": {
            "default": "Computer Software"
          },
          "sort": "250"
        },
        {
          "default": "0",
          "key": "48",
          "label": "Construction",
          "labels": {
            "default": "Construction"
          },
          "sort": "260"
        },
        {
          "default": "0",
          "key": "24",
          "label": "Consumer Electronics",
          "labels": {
            "default": "Consumer Electronics"
          },
          "sort": "270"
        },
        {
          "default": "0",
          "key": "25",
          "label": "Consumer Goods",
          "labels": {
            "default": "Consumer Goods"
          },
          "sort": "280"
        },
        {
          "default": "0",
          "key": "91",
          "label": "Consumer Services",
          "labels": {
            "default": "Consumer Services"
          },
          "sort": "290"
        },
        {
          "default": "0",
          "key": "18",
          "label": "Cosmetics",
          "labels": {
            "default": "Cosmetics"
          },
          "sort": "300"
        },
        {
          "default": "0",
          "key": "65",
          "label": "Dairy",
          "labels": {
            "default": "Dairy"
          },
          "sort": "310"
        },
        {
          "default": "0",
          "key": "1",
          "label": "Defense & Space",
          "labels": {
            "default": "Defense & Space"
          },
          "sort": "320"
        },
        {
          "default": "0",
          "key": "99",
          "label": "Design",
          "labels": {
            "default": "Design"
          },
          "sort": "330"
        },
        {
          "default": "0",
          "key": "69",
          "label": "Education Management",
          "labels": {
            "default": "Education Management"
          },
          "sort": "340"
        },
        {
          "default": "0",
          "key": "132",
          "label": "E-Learning",
          "labels": {
            "default": "E-Learning"
          },
          "sort": "350"
        },
        {
          "default": "0",
          "key": "112",
          "label": "Electrical/Electronic Manufacturing",
          "labels": {
            "default": "Electrical/Electronic Manufacturing"
          },
          "sort": "360"
        },
        {
          "default": "0",
          "key": "28",
          "label": "Entertainment",
          "labels": {
            "default": "Entertainment"
          },
          "sort": "370"
        },
        {
          "default": "0",
          "key": "86",
          "label": "Environmental Services",
          "labels": {
            "default": "Environmental Services"
          },
          "sort": "380"
        },
        {
          "default": "0",
          "key": "110",
          "label": "Events Services",
          "labels": {
            "default": "Events Services"
          },
          "sort": "390"
        },
        {
          "default": "0",
          "key": "76",
          "label": "Executive Office",
          "labels": {
            "default": "Executive Office"
          },
          "sort": "400"
        },
        {
          "default": "0",
          "key": "122",
          "label": "Facilities Services",
          "labels": {
            "default": "Facilities Services"
          },
          "sort": "410"
        },
        {
          "default": "0",
          "key": "63",
          "label": "Farming",
          "labels": {
            "default": "Farming"
          },
          "sort": "420"
        },
        {
          "default": "0",
          "key": "43",
          "label": "Financial Services",
          "labels": {
            "default": "Financial Services"
          },
          "sort": "430"
        },
        {
          "default": "0",
          "key": "38",
          "label": "Fine Art",
          "labels": {
            "default": "Fine Art"
          },
          "sort": "440"
        },
        {
          "default": "0",
          "key": "66",
          "label": "Fishery",
          "labels": {
            "default": "Fishery"
          },
          "sort": "450"
        },
        {
          "default": "0",
          "key": "34",
          "label": "Food & Beverages",
          "labels": {
            "default": "Food & Beverages"
          },
          "sort": "460"
        },
        {
          "default": "0",
          "key": "23",
          "label": "Food Production",
          "labels": {
            "default": "Food Production"
          },
          "sort": "470"
        },
        {
          "default": "0",
          "key": "101",
          "label": "Fund-Raising",
          "labels": {
            "default": "Fund-Raising"
          },
          "sort": "480"
        },
        {
          "default": "0",
          "key": "26",
          "label": "Furniture",
          "labels": {
            "default": "Furniture"
          },
          "sort": "490"
        },
        {
          "default": "0",
          "key": "29",
          "label": "Gambling & Casinos",
          "labels": {
            "default": "Gambling & Casinos"
          },
          "sort": "500"
        },
        {
          "default": "0",
          "key": "145",
          "label": "Glass, Ceramics & Concrete",
          "labels": {
            "default": "Glass, Ceramics & Concrete"
          },
          "sort": "510"
        },
        {
          "default": "0",
          "key": "75",
          "label": "Government Administration",
          "labels": {
            "default": "Government Administration"
          },
          "sort": "520"
        },
        {
          "default": "0",
          "key": "148",
          "label": "Government Relations",
          "labels": {
            "default": "Government Relations"
          },
          "sort": "530"
        },
        {
          "default": "0",
          "key": "140",
          "label": "Graphic Design",
          "labels": {
            "default": "Graphic Design"
          },
          "sort": "540"
        },
        {
          "default": "0",
          "key": "124",
          "label": "Health, Wellness and Fitness",
          "labels": {
            "default": "Health, Wellness and Fitness"
          },
          "sort": "550"
        },
        {
          "default": "0",
          "key": "68",
          "label": "Higher Education",
          "labels": {
            "default": "Higher Education"
          },
          "sort": "560"
        },
        {
          "default": "0",
          "key": "14",
          "label": "Hospital & Health Care",
          "labels": {
            "default": "Hospital & Health Care"
          },
          "sort": "570"
        },
        {
          "default": "0",
          "key": "31",
          "label": "Hospitality",
          "labels": {
            "default": "Hospitality"
          },
          "sort": "580"
        },
        {
          "default": "0",
          "key": "137",
          "label": "Human Resources",
          "labels": {
            "default": "Human Resources"
          },
          "sort": "590"
        },
        {
          "default": "0",
          "key": "134",
          "label": "Import and Export",
          "labels": {
            "default": "Import and Export"
          },
          "sort": "600"
        },
        {
          "default": "0",
          "key": "88",
          "label": "Individual & Family Services",
          "labels": {
            "default": "Individual & Family Services"
          },
          "sort": "610"
        },
        {
          "default": "0",
          "key": "147",
          "label": "Industrial Automation",
          "labels": {
            "default": "Industrial Automation"
          },
          "sort": "620"
        },
        {
          "default": "0",
          "key": "84",
          "label": "Information Services",
          "labels": {
            "default": "Information Services"
          },
          "sort": "630"
        },
        {
          "default": "0",
          "key": "96",
          "label": "Information Technology and Services",
          "labels": {
            "default": "Information Technology and Services"
          },
          "sort": "640"
        },
        {
          "default": "0",
          "key": "42",
          "label": "Insurance",
          "labels": {
            "default": "Insurance"
          },
          "sort": "650"
        },
        {
          "default": "0",
          "key": "74",
          "label": "International Affairs",
          "labels": {
            "default": "International Affairs"
          },
          "sort": "660"
        },
        {
          "default": "0",
          "key": "141",
          "label": "International Trade and Development",
          "labels": {
            "default": "International Trade and Development"
          },
          "sort": "670"
        },
        {
          "default": "0",
          "key": "6",
          "label": "Internet",
          "labels": {
            "default": "Internet"
          },
          "sort": "680"
        },
        {
          "default": "0",
          "key": "45",
          "label": "Investment Banking",
          "labels": {
            "default": "Investment Banking"
          },
          "sort": "690"
        },
        {
          "default": "0",
          "key": "46",
          "label": "Investment Management",
          "labels": {
            "default": "Investment Management"
          },
          "sort": "700"
        },
        {
          "default": "0",
          "key": "73",
          "label": "Judiciary",
          "labels": {
            "default": "Judiciary"
          },
          "sort": "710"
        },
        {
          "default": "0",
          "key": "77",
          "label": "Law Enforcement",
          "labels": {
            "default": "Law Enforcement"
          },
          "sort": "720"
        },
        {
          "default": "0",
          "key": "9",
          "label": "Law Practice",
          "labels": {
            "default": "Law Practice"
          },
          "sort": "730"
        },
        {
          "default": "0",
          "key": "10",
          "label": "Legal Services",
          "labels": {
            "default": "Legal Services"
          },
          "sort": "740"
        },
        {
          "default": "0",
          "key": "72",
          "label": "Legislative Office",
          "labels": {
            "default": "Legislative Office"
          },
          "sort": "750"
        },
        {
          "default": "0",
          "key": "30",
          "label": "Leisure, Travel & Tourism",
          "labels": {
            "default": "Leisure, Travel & Tourism"
          },
          "sort": "760"
        },
        {
          "default": "0",
          "key": "85",
          "label": "Libraries",
          "labels": {
            "default": "Libraries"
          },
          "sort": "770"
        },
        {
          "default": "0",
          "key": "116",
          "label": "Logistics and Supply Chain",
          "labels": {
            "default": "Logistics and Supply Chain"
          },
          "sort": "780"
        },
        {
          "default": "0",
          "key": "143",
          "label": "Luxury Goods & Jewelry",
          "labels": {
            "default": "Luxury Goods & Jewelry"
          },
          "sort": "790"
        },
        {
          "default": "0",
          "key": "55",
          "label": "Machinery",
          "labels": {
            "default": "Machinery"
          },
          "sort": "800"
        },
        {
          "default": "0",
          "key": "11",
          "label": "Management Consulting",
          "labels": {
            "default": "Management Consulting"
          },
          "sort": "810"
        },
        {
          "default": "0",
          "key": "95",
          "label": "Maritime",
          "labels": {
            "default": "Maritime"
          },
          "sort": "820"
        },
        {
          "default": "0",
          "key": "97",
          "label": "Market Research",
          "labels": {
            "default": "Market Research"
          },
          "sort": "830"
        },
        {
          "default": "0",
          "key": "80",
          "label": "Marketing and Advertising",
          "labels": {
            "default": "Marketing and Advertising"
          },
          "sort": "840"
        },
        {
          "default": "0",
          "key": "135",
          "label": "Mechanical or Industrial Engineering",
          "labels": {
            "default": "Mechanical or Industrial Engineering"
          },
          "sort": "850"
        },
        {
          "default": "0",
          "key": "126",
          "label": "Media Production",
          "labels": {
            "default": "Media Production"
          },
          "sort": "860"
        },
        {
          "default": "0",
          "key": "17",
          "label": "Medical Devices",
          "labels": {
            "default": "Medical Devices"
          },
          "sort": "870"
        },
        {
          "default": "0",
          "key": "13",
          "label": "Medical Practice",
          "labels": {
            "default": "Medical Practice"
          },
          "sort": "880"
        },
        {
          "default": "0",
          "key": "139",
          "label": "Mental Health Care",
          "labels": {
            "default": "Mental Health Care"
          },
          "sort": "890"
        },
        {
          "default": "0",
          "key": "71",
          "label": "Military",
          "labels": {
            "default": "Military"
          },
          "sort": "900"
        },
        {
          "default": "0",
          "key": "56",
          "label": "Mining & Metals",
          "labels": {
            "default": "Mining & Metals"
          },
          "sort": "910"
        },
        {
          "default": "0",
          "key": "35",
          "label": "Motion Pictures and Film",
          "labels": {
            "default": "Motion Pictures and Film"
          },
          "sort": "920"
        },
        {
          "default": "0",
          "key": "37",
          "label": "Museums and Institutions",
          "labels": {
            "default": "Museums and Institutions"
          },
          "sort": "930"
        },
        {
          "default": "0",
          "key": "115",
          "label": "Music",
          "labels": {
            "default": "Music"
          },
          "sort": "940"
        },
        {
          "default": "0",
          "key": "114",
          "label": "Nanotechnology",
          "labels": {
            "default": "Nanotechnology"
          },
          "sort": "950"
        },
        {
          "default": "0",
          "key": "81",
          "label": "Newspapers",
          "labels": {
            "default": "Newspapers"
          },
          "sort": "960"
        },
        {
          "default": "0",
          "key": "100",
          "label": "Non-Profit Organization Management",
          "labels": {
            "default": "Non-Profit Organization Management"
          },
          "sort": "970"
        },
        {
          "default": "0",
          "key": "57",
          "label": "Oil & Energy",
          "labels": {
            "default": "Oil & Energy"
          },
          "sort": "980"
        },
        {
          "default": "0",
          "key": "113",
          "label": "Online Media",
          "labels": {
            "default": "Online Media"
          },
          "sort": "990"
        },
        {
          "default": "0",
          "key": "123",
          "label": "Outsourcing/Offshoring",
          "labels": {
            "default": "Outsourcing/Offshoring"
          },
          "sort": "1000"
        },
        {
          "default": "0",
          "key": "87",
          "label": "Package/Freight Delivery",
          "labels": {
            "default": "Package/Freight Delivery"
          },
          "sort": "1010"
        },
        {
          "default": "0",
          "key": "146",
          "label": "Packaging and Containers",
          "labels": {
            "default": "Packaging and Containers"
          },
          "sort": "1020"
        },
        {
          "default": "0",
          "key": "61",
          "label": "Paper & Forest Products",
          "labels": {
            "default": "Paper & Forest Products"
          },
          "sort": "1030"
        },
        {
          "default": "0",
          "key": "39",
          "label": "Performing Arts",
          "labels": {
            "default": "Performing Arts"
          },
          "sort": "1040"
        },
        {
          "default": "0",
          "key": "15",
          "label": "Pharmaceuticals",
          "labels": {
            "default": "Pharmaceuticals"
          },
          "sort": "1050"
        },
        {
          "default": "0",
          "key": "131",
          "label": "Philanthropy",
          "labels": {
            "default": "Philanthropy"
          },
          "sort": "1060"
        },
        {
          "default": "0",
          "key": "136",
          "label": "Photography",
          "labels": {
            "default": "Photography"
          },
          "sort": "1070"
        },
        {
          "default": "0",
          "key": "117",
          "label": "Plastics",
          "labels": {
            "default": "Plastics"
          },
          "sort": "1080"
        },
        {
          "default": "0",
          "key": "107",
          "label": "Political Organization",
          "labels": {
            "default": "Political Organization"
          },
          "sort": "1090"
        },
        {
          "default": "0",
          "key": "67",
          "label": "Primary/Secondary Education",
          "labels": {
            "default": "Primary/Secondary Education"
          },
          "sort": "1100"
        },
        {
          "default": "0",
          "key": "83",
          "label": "Printing",
          "labels": {
            "default": "Printing"
          },
          "sort": "1110"
        },
        {
          "default": "0",
          "key": "105",
          "label": "Professional Training & Coaching",
          "labels": {
            "default": "Professional Training & Coaching"
          },
          "sort": "1120"
        },
        {
          "default": "0",
          "key": "102",
          "label": "Program Development",
          "labels": {
            "default": "Program Development"
          },
          "sort": "1130"
        },
        {
          "default": "0",
          "key": "79",
          "label": "Public Policy",
          "labels": {
            "default": "Public Policy"
          },
          "sort": "1140"
        },
        {
          "default": "0",
          "key": "98",
          "label": "Public Relations and Communications",
          "labels": {
            "default": "Public Relations and Communications"
          },
          "sort": "1150"
        },
        {
          "default": "0",
          "key": "78",
          "label": "Public Safety",
          "labels": {
            "default": "Public Safety"
          },
          "sort": "1160"
        },
        {
          "default": "0",
          "key": "82",
          "label": "Publishing",
          "labels": {
            "default": "Publishing"
          },
          "sort": "1170"
        },
        {
          "default": "0",
          "key": "62",
          "label": "Railroad Manufacture",
          "labels": {
            "default": "Railroad Manufacture"
          },
          "sort": "1180"
        },
        {
          "default": "0",
          "key": "64",
          "label": "Ranching",
          "labels": {
            "default": "Ranching"
          },
          "sort": "1190"
        },
        {
          "default": "0",
          "key": "44",
          "label": "Real Estate",
          "labels": {
            "default": "Real Estate"
          },
          "sort": "1200"
        },
        {
          "default": "0",
          "key": "40",
          "label": "Recreational Facilities and Services",
          "labels": {
            "default": "Recreational Facilities and Services"
          },
          "sort": "1210"
        },
        {
          "default": "0",
          "key": "89",
          "label": "Religious Institutions",
          "labels": {
            "default": "Religious Institutions"
          },
          "sort": "1220"
        },
        {
          "default": "0",
          "key": "144",
          "label": "Renewables & Environment",
          "labels": {
            "default": "Renewables & Environment"
          },
          "sort": "1230"
        },
        {
          "default": "0",
          "key": "70",
          "label": "Research",
          "labels": {
            "default": "Research"
          },
          "sort": "1240"
        },
        {
          "default": "0",
          "key": "32",
          "label": "Restaurants",
          "labels": {
            "default": "Restaurants"
          },
          "sort": "1250"
        },
        {
          "default": "0",
          "key": "27",
          "label": "Retail",
          "labels": {
            "default": "Retail"
          },
          "sort": "1260"
        },
        {
          "default": "0",
          "key": "121",
          "label": "Security and Investigations",
          "labels": {
            "default": "Security and Investigations"
          },
          "sort": "1270"
        },
        {
          "default": "0",
          "key": "7",
          "label": "Semiconductors",
          "labels": {
            "default": "Semiconductors"
          },
          "sort": "1280"
        },
        {
          "default": "0",
          "key": "58",
          "label": "Shipbuilding",
          "labels": {
            "default": "Shipbuilding"
          },
          "sort": "1290"
        },
        {
          "default": "0",
          "key": "20",
          "label": "Sporting Goods",
          "labels": {
            "default": "Sporting Goods"
          },
          "sort": "1300"
        },
        {
          "default": "0",
          "key": "33",
          "label": "Sports",
          "labels": {
            "default": "Sports"
          },
          "sort": "1310"
        },
        {
          "default": "0",
          "key": "104",
          "label": "Staffing and Recruiting",
          "labels": {
            "default": "Staffing and Recruiting"
          },
          "sort": "1320"
        },
        {
          "default": "0",
          "key": "22",
          "label": "Supermarkets",
          "labels": {
            "default": "Supermarkets"
          },
          "sort": "1330"
        },
        {
          "default": "0",
          "key": "8",
          "label": "Telecommunications",
          "labels": {
            "default": "Telecommunications"
          },
          "sort": "1340"
        },
        {
          "default": "0",
          "key": "60",
          "label": "Textiles",
          "labels": {
            "default": "Textiles"
          },
          "sort": "1350"
        },
        {
          "default": "0",
          "key": "130",
          "label": "Think Tanks",
          "labels": {
            "default": "Think Tanks"
          },
          "sort": "1360"
        },
        {
          "default": "0",
          "key": "21",
          "label": "Tobacco",
          "labels": {
            "default": "Tobacco"
          },
          "sort": "1370"
        },
        {
          "default": "0",
          "key": "108",
          "label": "Translation and Localization",
          "labels": {
            "default": "Translation and Localization"
          },
          "sort": "1380"
        },
        {
          "default": "0",
          "key": "92",
          "label": "Transportation/Trucking/Railroad",
          "labels": {
            "default": "Transportation/Trucking/Railroad"
          },
          "sort": "1390"
        },
        {
          "default": "0",
          "key": "59",
          "label": "Utilities",
          "labels": {
            "default": "Utilities"
          },
          "sort": "1400"
        },
        {
          "default": "0",
          "key": "106",
          "label": "Venture Capital & Private Equity",
          "labels": {
            "default": "Venture Capital & Private Equity"
          },
          "sort": "1410"
        },
        {
          "default": "0",
          "key": "16",
          "label": "Veterinary",
          "labels": {
            "default": "Veterinary"
          },
          "sort": "1420"
        },
        {
          "default": "0",
          "key": "93",
          "label": "Warehousing",
          "labels": {
            "default": "Warehousing"
          },
          "sort": "1430"
        },
        {
          "default": "0",
          "key": "133",
          "label": "Wholesale",
          "labels": {
            "default": "Wholesale"
          },
          "sort": "1440"
        },
        {
          "default": "0",
          "key": "142",
          "label": "Wine and Spirits",
          "labels": {
            "default": "Wine and Spirits"
          },
          "sort": "1450"
        },
        {
          "default": "0",
          "key": "119",
          "label": "Wireless",
          "labels": {
            "default": "Wireless"
          },
          "sort": "1460"
        },
        {
          "default": "0",
          "key": "103",
          "label": "Writing and Editing",
          "labels": {
            "default": "Writing and Editing"
          },
          "sort": "1470"
        }
      ],
      "rules": [
        {
          "rule": "maxitems",
          "data": "3"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "employmentStatus",
      "label": "Employment status",
      "sort": "60",
      "required": true,
      "type": "SELECT",
      "options": [
        {
          "default": "0",
          "key": "INTERNSHIP",
          "label": "Internship",
          "labels": {
            "default": "Internship"
          },
          "sort": "0"
        },
        {
          "default": "0",
          "key": "VOLUNTEER",
          "label": "Volunteer",
          "labels": {
            "default": "Volunteer"
          },
          "sort": "0"
        },
        {
          "default": "0",
          "key": "FULL_TIME",
          "label": "Full time",
          "labels": {
            "default": "Full time"
          },
          "sort": "0"
        },
        {
          "default": "0",
          "key": "PART_TIME",
          "label": "Part time",
          "labels": {
            "default": "Part time"
          },
          "sort": "0"
        },
        {
          "default": "0",
          "key": "CONTRACT",
          "label": "Contract",
          "labels": {
            "default": "Contract"
          },
          "sort": "0"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "experienceLevel",
      "label": "Experience level",
      "sort": "70",
      "required": false,
      "type": "SELECT",
      "options": [
        {
          "default": "0",
          "key": "ENTRY_LEVEL",
          "label": "Entry level",
          "labels": {
            "default": "Entry level"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "MID_SENIOR_LEVEL",
          "label": "Mid senior level",
          "labels": {
            "default": "Mid senior level"
          },
          "sort": "20"
        },
        {
          "default": "0",
          "key": "DIRECTOR",
          "label": "Director",
          "labels": {
            "default": "Director"
          },
          "sort": "30"
        },
        {
          "default": "0",
          "key": "EXECUTIVE",
          "label": "Executive",
          "labels": {
            "default": "Executive"
          },
          "sort": "40"
        },
        {
          "default": "0",
          "key": "INTERNSHIP",
          "label": "Internship",
          "labels": {
            "default": "Internship"
          },
          "sort": "50"
        },
        {
          "default": "0",
          "key": "ASSOCIATE",
          "label": "Associate",
          "labels": {
            "default": "Associate"
          },
          "sort": "60"
        },
        {
          "default": "0",
          "key": "NOT_APPLICABLE",
          "label": "Not applicable",
          "labels": {
            "default": "Not applicable"
          },
          "sort": "70"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "posterEmail",
      "label": "LinkedIn Recruiter seat e-mail",
      "sort": "75",
      "required": false,
      "type": "TEXT",
      "options": [],
      "rules": [
        {
          "rule": "email",
          "data": ""
        }
      ],
      "autocomplete": null
    },
    {
      "name": "showPosterInfo",
      "label": "Show posterInfo",
      "sort": "80",
      "required": true,
      "type": "SELECT",
      "options": [
        {
          "default": "1",
          "key": "false",
          "label": "False",
          "labels": {
            "default": "False"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "true",
          "label": "True",
          "labels": {
            "default": "True"
          },
          "sort": "20"
        }
      ],
      "autocomplete": null
    },
    {
      "name": "workRemoteAllowed",
      "label": "Remote work allowed",
      "sort": "90",
      "required": false,
      "type": "SELECT",
      "options": [
        {
          "default": "0",
          "key": "yes",
          "label": "Yes",
          "labels": {
            "default": "Yes"
          },
          "sort": "10"
        },
        {
          "default": "0",
          "key": "no",
          "label": "No",
          "labels": {
            "default": "No"
          },
          "sort": "20"
        }
      ],
      "autocomplete": null
    }
  ]
}
```


# Retrieve Contract

This endpoint retrieves the detail for a customer contract. It contains a reference to a channel, an (encrypted) credential payload, and the facets set for the My Contracts product.

```ruby
def retrieve_contract(contract_id,
                      x_customer_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `contract_id` | `String` | Template, Required | - |
| `x_customer_id` | `String` | Header, Required | An identifier for the remote customer |

## Response Type

[`ContractModel`](../../doc/models/contract-model.md)

## Example Usage

```ruby
contract_id = 'contract_id8'
x_customer_id = 'X-Customer-Id2'

result = contracts_controller.retrieve_contract(contract_id, x_customer_id)
```

## Example Response *(as JSON)*

```json
{
  "contract_id": "06a8f6f0-5e0e-4614-869e-ab95a8530633",
  "customer_id": "c0cbefa5-6f04-4dbc-8208-5963bc433166",
  "channel_id": 0,
  "credentials": {},
  "class_name": "",
  "facets": {},
  "product": {
    "product_id": "",
    "title": ""
  },
  "posting_requirements": [],
  "expiry_date": "2022-02-15T12:03:45.053Z",
  "credits": 0,
  "purchase_price": {
    "amount": 0,
    "currency": "string"
  }
}
```


# Retrieve Multiple Contracts

This endpoint exposes a list of multiple contracts, if available to a specific customer.

```ruby
def retrieve_multiple_contracts(contracts_ids,
                                limit: nil,
                                offset: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `contracts_ids` | `Array<String>` | Template, Required | - |
| `limit` | `Float` | Query, Optional | Amount of contracts returned |
| `offset` | `Float` | Query, Optional | Starting point |

## Response Type

[`MultipleContractsResponseModel`](../../doc/models/multiple-contracts-response-model.md)

## Example Usage

```ruby
contracts_ids = ['contracts_ids7', 'contracts_ids8']

result = contracts_controller.retrieve_multiple_contracts(contracts_ids, )
```

## Example Response *(as JSON)*

```json
{
  "count": 2,
  "next": "string",
  "previous": "string",
  "results": [
    {
      "customer_id": "76e124d4-ae69-4753-bede-259d505258b7",
      "contract_id": "3a283b8f-1670-404b-b804-92f67e66b71c",
      "channel_id": 13,
      "credentials": {},
      "class_name": "",
      "facets": {},
      "product": {
        "product_id": "2e8c3c17-179b-4db1-9e2b-d48369b5e409",
        "title": "product title"
      },
      "expiry_date": null,
      "credits": 12,
      "posting_requirements": []
    },
    {
      "customer_id": "76e124d4-ae69-4753-bede-259d505258b7",
      "contract_id": "3a283b8f-1670-404b-b804-92f67e66b71c",
      "channel_id": 13,
      "expiry_date": null,
      "credits": 3,
      "credentials": {},
      "class_name": "",
      "facets": {},
      "product": {
        "product_id": "2e8c3c17-179b-4db1-9e2b-d48369b5e409",
        "title": "product title"
      },
      "posting_requirements": []
    }
  ]
}
```

