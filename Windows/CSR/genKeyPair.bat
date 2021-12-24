REM ##############################################
REM # private/public key pair generation 	 #
REM ##############################################

REM
REM /!\ IMPORTANT : Code Signing Certificate Common Name should be identical to the Organization Name
REM https://knowledge.symantec.com/support/code-signing-support/index?page=content&actp=CROSSLINK&id=SO7239

REM Common Name: My Company
REM Organization Unit: OSS
REM Organization: My Company
REM Locality: Paris
REM State: IdF
REM Country: FR
REM Friendly name : Java Web Application Signing Certificate
REM Description : Java Web Application Signing Certificate

REM ##################################################################################################################################################
REM # 						 												                                                                         #
REM # /!\ ATTENTION  																                                                                 #
REM # https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html#keytool_option_genkeypair		                                         #
REM # https://docs.oracle.com/en/java/javase/11/tools/keytool.html                                                                                   #	
REM # 						 												                                                                         #
REM # This command was named -genkey in earlier releases. The old name is still supported in this release. 					                         #
REM # The new name, -genkeypair, is preferred going forward.	                                                                                     #
REM # 						 												                                                                         #
REM # In generating a public/private key pair, the signature algorithm (-sigalg option) is derived from the algorithm of the underlying private key: #
REM # 						 												                                                                         #
REM #     If the underlying private key is of type DSA, then the -sigalg option defaults to SHA1withDSA.					                         #
REM # 						 												                                                                         #
REM #     If the underlying private key is of type RSA, then the -sigalg option defaults to SHA256withRSA.					                         #
REM # 						 												                                                                         #
REM #     If the underlying private key is of type EC, then the -sigalg option defaults to SHA256withECDSA.					                         #
REM # 						 												                                                                         #
REM # For a full list of -keyalg and -sigalg arguments, see Java Cryptography Architecture (JCA) Reference Guide at				                     #
REM # http://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html#AppA						                             #
REM # 						 												                                                                         #
REM # 						 												                                                                         #
REM ##################################################################################################################################################

set JDK_HOME="C:\Program Files\Java\jdk1.8.0_221"
keytool -genkeypair -validity 1095 -alias oss-java-web-app -keyalg RSA -keysize 2048 -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v

REM # Default keystore type is set in property keystore.type=jks at  C:\Program Files (x86)\Java\jre1.8.0_xxx\lib\security\java.security & keystore.type=pkcs12 in C:\Program Files\Java\jdk-11.x.x\conf\security\java.security
REM # ==> it is jks in Java 8 and PKCS12 in Java 9, with PKCS12, -keypass argument is useless
REM # https://docs.oracle.com/javase/9/security/java-pki-programmers-guide.htm
REM  # https://docs.oracle.com/javase/9/tools/keytool.htm#JSWOR-GUID-5990A2E4-78E3-47B7-AE75-6D1826259549
REM # 
REM # https://docs.oracle.com/en/java/javase/11/security/java-pki-programmers-guide.html
REM # "As of JDK 9, the default keystore implementation is PKCS12. This is a cross platform keystore based on the RSA PKCS12 Personal Information Exchange Syntax Standard. This standard is primarily meant for storing or transporting a user's private keys, certificates, and miscellaneous secrets. There is another built-in implementation, provided by Oracle. It implements the keystore as a file with a proprietary keystore type (format) named JKS. It protects each private key with its individual password, and also protects the integrity of the entire keystore with a (possibly different) password."
REM # https://tools.ietf.org/html/rfc5280
REM # https://docs.oracle.com/javase/8/docs/api/java/security/cert/Certificate.html
REM # https://docs.oracle.com/javase/8/docs/api/index.html
REM # you can add the attributes : STREET, T, SURNAME, GIVENNAME, INITIALS, IP EMAIL, EMAILADDRESS
REM # which attribute for friendlyName ?

"C:\Program Files\Java\jdk-9.0.1\bin\keytool" -genkeypair -dname "CN=mycompany.com, OU=IT, O=mycompany.com, L=Paris, ST=IDF, C=FR, emailAddress=DevOps-KissMyApp@groland.grd" -ext SAN=dns:mycompany.com -keyalg RSA -keysize 2048 -validity 1095 -alias oss-java-web-app  -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v 
"C:\Program Files\Java\jdk-9.0.1\bin\keytool" -genkeypair -dname "CN=John DOE, OU=IT, O=mycompany.com, STREET=1 London Street, L=777 London, ST=BK, C=UK, T=M, SURNAME=DOE, GIVENNAME=John, INITIALS=J.D, IP=MyIP, emailAddress=john.doe@mycompany.com" -keyalg RSA -keysize 2048 -validity 1095 -alias user-cert  -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v 

REM after keypair generation, note the SHA-256 hash : 