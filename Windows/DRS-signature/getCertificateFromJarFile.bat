mkdir temp
cd temp
jar -xvf ../foo.jar
cd META-INF
openssl pkcs7 -in FOO.RSA -print_certs -inform DER -out foo.cer
# in case of bug displaying only 1 out of the 3 certificates of the chain, open the output file *.cer with notepad and get the --BEGIN --END block ...

