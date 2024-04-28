/**
*
* This module contains logic for converting country representation values
*/

%dw 2.5
//CONSTANTS
/**
* Constant for country definitions
*/
var countryMapping =
[{
	"name": "Afghanistan",
	"alpha2": "AF",
	"alpha3": "AFG"
},
  {
	"name": "Albania",
	"alpha2": "AL",
	"alpha3": "ALB"
},
  {
	"name": "Algeria",
	"alpha2": "DZ",
	"alpha3": "DZA"
},
  {
	"name": "Andorra",
	"alpha2": "AD",
	"alpha3": "AND"
},
  {
	"name": "Angola",
	"alpha2": "AO",
	"alpha3": "AGO"
},
  {
	"name": "Antigua and Barbuda",
	"alpha2": "AG",
	"alpha3": "ATG"
},
  {
	"name": "Argentina",
	"alpha2": "AR",
	"alpha3": "ARG"
}]

//TYPES
/**
* Set of allowed values for three letter country codes
*/
type ThreeLetterCode = "AFG" | "ALB" | "DZA" | "AND" | "AGO" | "ATG" | "ARG"

//TYPES
/**
* Set of allowed values for two letter country codes
*/
type TwoLetterCode = "AF" | "AL" | "DZ" | "AD" | "AO" | "AG" | "AR"

//TYPES
/**
* Set of allowed values for country names
*/
type CountryName = "Afghanistan" | "Albania" | "Algeria" | "Andorra" | "Angola" | "Antigua and Barbuda" | "Argentina"

/**
* Get a two letter country code based on the country name or it's three letter country code.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `valueToConvert` | ThreeLetterCode &#124; CountryName | ThreeLetterCode: ["AFG", "ALB", "DZA", "AND", "AGO", "ATG", "ARG"] <br/>CountryName: ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina"]
* |===
*
* === Example
*
* This example shows how the `getShortCode` function behaves under different inputs.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* import getShortCode from CountryConverter
* ---
*{
*	twoLetterCodeFromName: getShortCode("Argentina"),
*	twoLetterCodeFromThreeLetterCode: getShortCode("ARG")
*}
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
*{
*	twoLetterCodeFromName: "AR",
*	twoLetterCodeFromThreeLetterCode: "AR"
*}
* ----
*
*/
fun getShortCode(valueToConvert: ThreeLetterCode | CountryName): String =
	do{
		var correctMapping = valueToConvert match {
			case longCode if (countryMapping.alpha3 contains valueToConvert) -> (countryMapping filter ((country, index) -> country.alpha3 == valueToConvert))
			case name if (countryMapping.name contains valueToConvert) -> (countryMapping filter ((country, index) -> country.name == valueToConvert))
		}
    ---
    correctMapping.alpha2[0]
	}

/**
* Get a three letter country code based on the country name or it's two letter country code.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `valueToConvert` | TwoLetterCode &#124; CountryName | TwoLetterCode: ["AF", "AL", "DZ", "AD", "AO", "AG", "AR"] <br/>CountryName: ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina"]
* |===
*
* === Example
*
* This example shows how the `getLongCode` function behaves under different inputs.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* import getLongCode from CountryConverter
* ---
*{
*	threeLetterCodeFromName: getLongCode("Argentina"),
*	threeLetterCodeFromTwoLetterCode: getLongCode("AR")
*}
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
*{
*	threeLetterCodeFromName: "ARG",
*	threeLetterCodeFromTwoLetterCode: "ARG"
*}
* ----
*
*/
fun getLongCode(valueToConvert: TwoLetterCode | CountryName): String =
	do{
		var correctMapping = valueToConvert match {
			case shortCode if (countryMapping.alpha2 contains valueToConvert) -> (countryMapping filter ((country, index) -> country.alpha2 == valueToConvert))
			case name if (countryMapping.name contains valueToConvert) -> (countryMapping filter ((country, index) -> country.name == valueToConvert))
		}
    ---
    correctMapping.alpha3[0]
	}

/**
* Get the country name based on it's two or three letter country code.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `valueToConvert` | TwoLetterCode &#124; ThreeLetterCode | TwoLetterCode: ["AF", "AL", "DZ", "AD", "AO", "AG", "AR"] <br/>ThreeLetterCode: ["AFG", "ALB", "DZA", "AND", "AGO", "ATG", "ARG"]
* |===
*
* === Example
*
* This example shows how the `getName` function behaves under different inputs.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* import getName from CountryConverter
* ---
*{
*	nameFromTwoLetterCode: getName("AR"),
*	nameFromThreeLetterCode: getName("ARG")
*}
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
*{
*	nameFromTwoLetterCode: "Argentina",
*	nameFromThreeLetterCode: "Argentina"
*}
* ----
*
*/
fun getName(valueToConvert: TwoLetterCode | ThreeLetterCode): String =
	do{
		var correctMapping = valueToConvert match {
			case shortCode if (countryMapping.alpha2 contains valueToConvert) -> (countryMapping filter ((country, index) -> country.alpha2 == valueToConvert))
			case longCode if (countryMapping.alpha3 contains valueToConvert) -> (countryMapping filter ((country, index) -> country.alpha3 == valueToConvert))
		}
    ---
    correctMapping.name[0]
	}