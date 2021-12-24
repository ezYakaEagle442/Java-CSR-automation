########################
# Certificate import   #
########################
keytool -keystore oss-java-web-app.jks -storepass:file store-pass.txt -importcert -file root-ca.cer -alias root-ca -v
keytool -keystore oss-java-web-app.jks -storepass:file store-pass.txt -importcert -file code-signing-ca.cer -alias signing-issue-ca -v
keytool -keystore oss-java-web-app.jks -storepass:file store-pass.txt -importcert -file issuing-ca.cer -alias tls-issue-ca -v
keytool -keystore oss-java-web-app.jks -storepass:file store-pass.txt -importcert -file oss-java-web-app.cer -alias oss-java-web-app -keypass:file key-pass.txt -v

# after certificate import, note SHA-256 hash :