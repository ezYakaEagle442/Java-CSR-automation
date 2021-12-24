##########################################
# Snippet to test your file signature    #
##########################################

jar cfv DeploymentRuleSet.jar ruleset.xml  

# With TSA , requiring enterprise proxy :
jarsigner -storepass:file store-pass.txt -keypass:file key-pass.txt -keystore oss-java-web-app.jks DeploymentRuleSet.jar oss-java-web-app -verbose -tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp  -J-Dhttp.proxyHost=gateway.mycompany.zscaler.net -J-Dhttp.proxyPort=80 

# standard signature
jarsigner -storepass:file store-pass.txt -keypass:file key-pass.txt -keystore oss-java-web-app.jks DeploymentRuleSet.jar oss-java-web-app -verbose