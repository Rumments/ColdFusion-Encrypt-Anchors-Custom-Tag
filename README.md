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

















