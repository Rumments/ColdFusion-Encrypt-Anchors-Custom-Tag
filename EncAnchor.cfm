<cfsetting enablecfoutputonly="true"><cfif IsDefined("Session.EncAnchorStatus") and (trim(lcase(Session.EncAnchorStatus)) is 'yes')><cfif !isdefined('Session.EncAnchorAlgorithm')><cfset Session.EncAnchorAlgorithm = 'DES'></cfif><cfif !isdefined('Session.EncAnchorKEY')><cfset Session.EncAnchorKEY = GenerateSecretKey(Session.EncAnchorAlgorithm)></cfif><cfif NOT IsDefined("thisTag.executionMode")><cfexit></cfif><cfif thisTag.executionMode is 'start'><cfreturn></cfif><cfset locStartofURLhref = FindNoCase('href', thisTag.GeneratedContent)><cfset locStartofHrefEquals = FindNoCase('=', thisTag.GeneratedContent, locStartofURLhref)><cfset locationHrefDoubleOpenedQuote = FindNoCase('"', thisTag.GeneratedContent, locStartofHrefEquals)><cfset locationHrefSingleQuote = FindNoCase("'", thisTag.GeneratedContent, locStartofHrefEquals)><cfif locationHrefDoubleOpenedQuote is 0><cfset locationHrefDoubleOpenedQuote = 999999></cfif><cfif locationHrefSingleQuote is 0><cfset locationHrefSingleQuote = 999999></cfif><cfif (locationHrefDoubleOpenedQuote is 0) and (locationHrefSingleQuote is 0)>ERROR: unquoted url data<cfabort><cfelseif locationHrefDoubleOpenedQuote lt locationHrefSingleQuote><cfset quotetype = '"'><cfset locationHrefOpenedQuote = locationHrefDoubleOpenedQuote><cfset locationHrefClosedQuote = FindNoCase(quotetype, thisTag.GeneratedContent, locationHrefOpenedQuote+1)><cfelseif locationHrefDoubleOpenedQuote gt locationHrefSingleQuote><cfset quotetype = "'"><cfset locationHrefOpenedQuote = locationHrefSingleQuote><cfset locationHrefClosedQuote = FindNoCase(quotetype, thisTag.GeneratedContent, locationHrefOpenedQuote+1)></cfif><cfset hrefdatastring = mid(thisTag.GeneratedContent, locationHrefOpenedQuote, 1+locationHrefClosedQuote-locationHrefOpenedQuote)><cfset locationQuesMark = FindNoCase('?', hrefdatastring)><cfset hrefstringDataToEncrypt=mid(hrefdatastring,1+locationQuesMark,len(hrefdatastring)-locationQuesMark-1)><cfset hrefdataEncrypt = Encrypt(hrefstringDataToEncrypt, Session.EncAnchorKEY , Session.EncAnchorAlgorithm)><cfset URLenc = URLEncodedFormat(hrefdataEncrypt)><cfset newhref= "UrlEnc=#URLenc#"><cfset thisTag.GeneratedContent = trim(Replace(thisTag.GeneratedContent, hrefstringDataToEncrypt , newhref))></cfif><cfsetting enablecfoutputonly="false">