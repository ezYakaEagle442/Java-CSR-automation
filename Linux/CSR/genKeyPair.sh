##############################################
# private/public key pair generation 	 #
##############################################

# /!\ IMPORTANT : Code Signing Certificate Common Name should be identical to the Organization Name
# https://knowledge.symantec.com/support/code-signing-support/index?page=content&actp=CROSSLINK&id=SO7239

# Common Name: My Company
# Organization Unit: OSS
# Organization: My Company
# Locality: Paris
# State: IdF
# Country: FR
# Friendly name : Java Web Application Signing Certificate
# Description : Java Web Application Signing Certificate

##################################################################################################################################################
# 						 												                                                                         #
# /!\ ATTENTION  																                                                                 #
# https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html#keytool_option_genkeypair		                                         #
# https://docs.oracle.com/en/java/javase/11/tools/keytool.html                                                                                   #	
# 						 												                                                                         #
# This command was named -genkey in earlier releases. The old name is still supported in this release. 					                         #
# The new name, -genkeypair, is preferred going forward.	                                                                                     #
# 						 												                                                                         #
# In generating a public/private key pair, the signature algorithm (-sigalg option) is derived from the algorithm of the underlying private key: #
# 						 												                                                                         #
#     If the underlying private key is of type DSA, then the -sigalg option defaults to SHA1withDSA.					                         #
# 						 												                                                                         #
#     If the underlying private key is of type RSA, then the -sigalg option defaults to SHA256withRSA.					                         #
# 						 												                                                                         #
#     If the underlying private key is of type EC, then the -sigalg option defaults to SHA256withECDSA.					                         #
# 						 												                                                                         #
# For a full list of -keyalg and -sigalg arguments, see Java Cryptography Architecture (JCA) Reference Guide at				                     #
# http://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html#AppA						                             #
# 						 												                                                                         #
# 						 												                                                                         #
##################################################################################################################################################

JDK_HOME="/usr/java/jdk1.8.0_221"
keytool -genkeypair -validity 1095 -alias oss-java-web-app -keyalg RSA -keysize 2048 -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v

# Default keystore type is set in property keystore.type=jks at  C:\Program Files (x86)\Java\jre1.8.0_xxx\lib\security\java.security & keystore.type=pkcs12 in C:\Program Files\Java\jdk-11.x.x\conf\security\java.security
# ==> it is jks in Java 8 and PKCS12 in Java 9, with PKCS12, -keypass argument is useless
# https://docs.oracle.com/javase/9/security/java-pki-programmers-guide.htm
 # https://docs.oracle.com/javase/9/tools/keytool.htm#JSWOR-GUID-5990A2E4-78E3-47B7-AE75-6D1826259549
# 
# https://docs.oracle.com/en/java/javase/11/security/java-pki-programmers-guide.html
# "As of JDK 9, the default keystore implementation is PKCS12. This is a cross platform keystore based on the RSA PKCS12 Personal Information Exchange Syntax Standard. This standard is primarily meant for storing or transporting a user's private keys, certificates, and miscellaneous secrets. There is another built-in implementation, provided by Oracle. It implements the keystore as a file with a proprietary keystore type (format) named JKS. It protects each private key with its individual password, and also protects the integrity of the entire keystore with a (possibly different) password."
# https://tools.ietf.org/html/rfc5280
# https://docs.oracle.com/javase/8/docs/api/java/security/cert/Certificate.html
# https://docs.oracle.com/javase/8/docs/api/index.html
# you can add the attributes : STREET, T, SURNAME, GIVENNAME, INITIALS, IP EMAIL, EMAILADDRESS
# which attribute for friendlyName ?

keytool -genkeypair -dname "CN=mycompany.com, OU=IT, O=mycompany.com, L=Paris, ST=IDF, C=FR, emailAddress=DevOps-KissMyApp@groland.grd" -ext SAN=dns:mycompany.com -keyalg RSA -keysize 2048 -validity 1095 -alias oss-java-web-app  -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v 
keytool -genkeypair -dname "CN=John DOE, OU=IT, O=mycompany.com, STREET=1 London Street, L=777 London, ST=BK, C=UK, T=M, SURNAME=DOE, GIVENNAME=John, INITIALS=J.D, IP=MyIP, emailAddress=john.doe@mycompany.com" -keyalg RSA -keysize 2048 -validity 1095 -alias user-cert  -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v 

after keypair generation, note the SHA-256 hash : 