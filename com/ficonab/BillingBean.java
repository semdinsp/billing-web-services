package com.ficonab;
import javax.jms.MessageListener;
import com.ficonab.FiconabBase;

//@MessageDriven(mappedName = "billing")
public class BillingBean extends FiconabBase  implements MessageListener {
		public  String get_topic() { return "billing"; }
	public String get_bootstrap_string() {
	String bootstrap_string = "gem 'billing_web_service' \nrequire 'billing_web_service'\n BillingWebService::BillingServer.new({:topic => 'billing', :jms_source => 'bwsserver'})"; 
	    return bootstrap_string;
	}
	

}