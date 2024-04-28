/**
* This mapping won't be shared through your library, but you can use it to try out your module and create integration tests.
*/
%dw 2.5
import * from CountryConverter

output application/json
---
{
    getShortCode : getShortCode("Argentina"),
    getLongCode : getLongCode("Argentina"),
    getName : getName("AR")
}