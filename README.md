# Encrypt-Anchors
Quickly encrypt and decrypt anchors in ColdFusion applications for increased security and ease of use

The ColdFusion Obfuscation Guide outlines ways of making URL variables secure using HASH.

See Here: https://cfdocs.org/security-obfuscation

While this method is ok in itself, there are quite a bit of shortcommings to useing it:

1) You have to write a lot of code
2) Loss of the easy use of URL variables and modification during testing
3) Does nothing to help update older applications without changing a lot of code

Encrypt-Anchors is made up of two modules
1) Custom tag: <cf_EncAnchor>
2) A Include module EncAnchorDecode

Its use can be controlled at the session level.

A developer can "Turn it off" to do work while not affecting pages accross the whole application. 

Insecure Anchor:

&lt;a href&#x3d;&quot;&#x2f;Junk&#x2f;code&#x2f;index.cfm&#x3f;value1&#x3d;Avalue&amp;fl&#x3d;id,abstract&amp;clientid&#x3d;9y4239y432&quot;&gt;Click Me&lt;&#x2f;a&gt;

Wrapped with custom tag:

&lt;cf_EncAnchor&gt;&lt;a href&#x3d;&quot;&#x2f;Junk&#x2f;code&#x2f;index.cfm&#x3f;value1&#x3d;Avalue&amp;fl&#x3d;id,abstract&amp;clientid&#x3d;9y4239y432&quot;&gt;Click Me&lt;&#x2f;a&gt;&lt;&#x2f;cf_EncAnchor&gt;

Creates the following link:

&lt;a href&#x3d;&quot;&#x2f;Junk/code/index.cfm?UrlEnc=MUM5%21%2B%3F%3B%20E7%2C%2AV%5ED1L6%2DWDB%3AF%3A%2B%27A%5E%2CB%28%40L%2BI0%3DT5%259%23SGJK%5BBK5I9%3E%2A%21BM%2D%40%0A%2B%2D%2AOU%5F7%21%40O34X%5C%260%20%0A&quot;&gt;Click Me&lt;&#x2f;a&gt;

All URL variables are converted to one DES encrypted variable "UrlEnc" and uses a different key per session (per user)

Decoding is automatic:
 The module is included in the onRequestStart portion of the Application.CFC file
 
    function onRequestStart( required string targetPage ) {
		  include "CustTags\EncAnchorDecode.cfm";
		  return true;
    }

The code decrypts the variables and recreates them for use by the application page.
When turned off, no URL variables get encrypted and development is easy
When deployed, its turned on, and all URL variables are encrypted using DES
Other than wrapping internal anchors with the custom tag, and adding the decode module to the application.cfc, nothing else needs to be done to use module. 

For those who are upgrading older applications and do not wish to change every internal URL and its variables this is a boon
The anchors only need to be wrapped, and the website will operate and format its pages as before, but be secure












