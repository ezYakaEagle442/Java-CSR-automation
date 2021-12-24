#####################
# CSR Generation    #
#####################

# /!\ IMPORTANT : Code Signing Certificate Common Name should be identical to the Organization Name
# https://knowledge.symantec.com/support/code-signing-support/index?page=content&actp=CROSSLINK&id=SO7239

##################################################################################################################################################
# 						 												                                                                         #
# /!\ ATTENTION  																                                                                 #
# https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html#keytool_option_certreq	                                             #
# https://docs.oracle.com/en/java/javase/11/tools/keytool.html                                                                                   #	
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
"${JDK_HOME}\bin\keytool" -certreq -keyalg RSA -alias oss-java-web-app -keysize 2048 -file oss-java-web-app.csr -keystore oss-java-web-app.jks -storepass:file store-pass.txt -keypass:file key-pass.txt -v

# Check CSR with https://www.sslshopper.com/csr-decoder.html
# openssl req -in mycsr.csr -noout -text

