%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
import * from CountryConverter

var record = countryMapping[0]
---
"CountryConverter" describedBy [
    "getShortCode" describedBy [
        "Convert three letter code to two letter code" in do {
            getShortCode(record.alpha3) must equalTo(record.alpha2)
        },
        "Convert name to two letter code" in do {
            getShortCode(record.name) must equalTo(record.alpha2)
        }
    ],
    "getLongCode" describedBy [
        "Convert two letter code to three letter code" in do {
            getLongCode(record.alpha2) must equalTo(record.alpha3)
        },
        "Convert name to two letter code" in do {
            getLongCode(record.name) must equalTo(record.alpha3)
        }
    ],
    "getName" describedBy [
        "Convert three letter code to country name" in do {
            getName(record.alpha3) must equalTo(record.name)
        },
        "Convert two letter code to country name" in do {
            getName(record.alpha2) must  equalTo(record.name)
        }
    ],
]