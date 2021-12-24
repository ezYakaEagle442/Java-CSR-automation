jar cfv DeploymentRuleSet.jar ruleset.xml  
jarsigner -storepass:file store-pass.txt -keypass:file key-pass.txt -keystore oss-java-web-app.jks -tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp DeploymentRuleSet.jar oss-java-web-app -verbose -J-Dhttp.proxyHost=gateway.mycompany.zscaler.net -J-Dhttp.proxyPort=80 
