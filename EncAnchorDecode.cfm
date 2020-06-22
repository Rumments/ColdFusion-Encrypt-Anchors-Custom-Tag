<cfsetting enablecfoutputonly="true">
<cfif !isdefined('Session.EncAnchorStatus')><cfset Session.EncAnchorStatus = 'yes'></cfif>
<cfif isdefined('UrlEnc')>
     <cfset decry = Decrypt(UrlEnc, Session.EncAnchorKEY , Session.EncAnchorAlgorithm)>
     <cfloop list="#decry#" index="Dcrypt" DELIMITERS="&">
           <cfif listlen(Dcrypt,"=") gt 1>
                <cfset tmasmbl = 'URL.#listGetAt(Dcrypt, 1 , "=")#' & "=">
                     <cfif FindNoCase('"', Dcrypt) >
                           <cfset tmasmbl = tmasmbl & "'" & listGetAt(Dcrypt, 2 , "=") & "'" >
                     <cfelseif FindNoCase("'", Dcrypt) >
                           <cfset tmasmbl = tmasmbl & '"' & listGetAt(Dcrypt, 2 , "=") & '"' >
                     <cfelse>
                           <cfif not isNumeric(listGetAt(Dcrypt, 2 , "="))>
                                <cfset tmasmbl = tmasmbl &"'#listGetAt(Dcrypt, 2 , "=")#'"  >
                           <cfelse><cfset tmasmbl = 'URL.#Dcrypt#'>
                     </cfif>
                </cfif>
                <cfset tempest = evaluate(tmasmbl)>
           </cfif>
     </cfloop>
     <cfset tmpurlenc = structDelete(URL, "UrlEnc")>
</cfif><cfsetting enablecfoutputonly="false">
