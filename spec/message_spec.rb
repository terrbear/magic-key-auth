require File.join(File.dirname(__FILE__), "spec_helper")

describe 'message' do
	before(:each) do
		MagicKeyAuth::SSL.key_location = KEY_DIR
	end
	
	it "should raise an error if key isn't found" do
		lambda {
			MagicKeyAuth::Message.new.digest
		}.should raise_error(MagicKeyAuth::NoKeyFound)
	end

	it "should go both ways" do
		message = MagicKeyAuth::Message.new(:keyfile => File.join(KEY_DIR, "private"))
		MagicKeyAuth::SSL.authenticate(:message => message.message,
																	 :digest => message.digest).should == "private"
	end

	it "should generate a signature for a message" do
		MagicKeyAuth::Message.new(:keyfile => File.join(KEY_DIR, "private"),
															:message => "hello my future girlfriend").digest.should_not be_nil
	end

	it "should default the message to a timestamp" do
		MagicKeyAuth::Message.new.message.to_i.should > 0
	end
end
