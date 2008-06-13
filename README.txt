wsdl2ruby.rb --wsdl http://10.43.31.137:9999/billingWS/services?wsdl --type client  --force 
generates
default.rb and ArgonWebServiceClient.rb  which are important

SEE THIS PATCH

http://dev.ctor.org/soap4r/changeset/1747


to test installation
1)  svbilling:9999/billingWS/services?wsdl must be up
    try  curl http://svbilling:9999/billingWS/services?wsdl  to see if wsdl up
2) ruby test/tc_billing   --should test everything
	NOTE that test/tc_billing will run but create wierd errors
	
	Building Message Bean:
	cp ../stomp_message/build/com/ficonab/F*.class build/com/ficonab/
	javac -cp $JRUBY_HOME/lib/jruby.jar:$GLASSFISH_ROOT/lib/j2ee.jar:./build -d build com/ficonab/BillingBean.java
	cd build
	jar cf ../billingbean.ear .
	cd ..
	asadmin deploy billingbean.ear
	asadmin deploy --host svbalance.cure.com.ph --port 2626 billingbean.ear
	
	OLD
		jar cf ../billingbean.jar .
	cp billingbean.jar ../../glassfish/domains/domain1/autodeploy/
NEED mysql connnector in classpath or db driver
	CLASSPATH:
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/j2ee.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/appserv-rt.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/javaee.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/j2ee-svc.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/appserv-ee.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/activation.jar
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/dbschema.jar 
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/appserv-admin.jar 
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/install/applications/jmsra/imqjmx.jar   
	export CLASSPATH=$CLASSPATH:$GLASSFISH_ROOT/lib/install/applications/jmsra/imqjmsra.jar
	
	
	httpclient patch
	I've attach a patch for httpclient-2.1.2 that simply adds a nil? check to HTTPClient's certificate loading method and allows you to access regular HTTP web services using SOAP4R-1.5.8. However, it does nothing to fix the PKCS7.read_smime problem.

	===================================================================
	— lib/httpclient.rb (revision 191)
	+++ lib/httpclient.rb (working copy)
	@@ -387,7 +387,7 @@
	selfcert = OpenSSL::X509::Certificate.new(dist_cert)
	store = OpenSSL::X509::Store.new
	store.add_cert(selfcert)

	    * if (p7.verify(nil, store, p7.data, 0))
	      + if (!p7.nil? && p7.verify(nil, store, p7.data, 0))
	      set_trust_ca(file)
	      else
	      STDERR.puts("cacerts: #{file} loading failed")

	[ Show » ]
	Britt Crawford - 13/Mar/08 03:07 PM This issue also seems to be affecting non-SSL web services using SOAP4R 1.5.8 as well. I get the same error when trying to connect to an unsecured web service. I've attach a patch for httpclient-2.1.2 that simply adds a nil? check to HTTPClient's certificate loading method and allows you to access regular HTTP web services using SOAP4R-1.5.8. However, it does nothing to fix the PKCS7.read_smime problem. =================================================================== — lib/httpclient.rb (revision 191) +++ lib/httpclient.rb (working copy) @@ -387,7 +387,7 @@ selfcert = OpenSSL::X509::Certificate.new(dist_cert) store = OpenSSL::X509::Store.new store.add_cert(selfcert)

	    * if (p7.verify(nil, store, p7.data, 0)) + if (!p7.nil? && p7.verify(nil, store, p7.data, 0)) set_trust_ca(file) else STDERR.puts("cacerts: #{file} loading failed")

	


