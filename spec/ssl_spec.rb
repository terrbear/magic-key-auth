require File.join(File.dirname(__FILE__), "spec_helper")
require 'ezsig'
								
describe 'ssl key auth' do

	before(:each) do
		MagicKeyAuth::SSL.key_location = KEY_DIR
	end

	it "should give name of key that authenticates correctly" do
		signer = EzCrypto::Signer.from_file(File.join(KEY_DIR, "private"))
		timestamp = Time.now.to_i.to_s
		MagicKeyAuth::SSL.authenticate(:message => timestamp, :digest => signer.sign(timestamp)).should == "private"
	end

	it "should return nil if no valid key is found" do
		MagicKeyAuth::SSL.authenticate(:message => Time.now.utc, :digest => "omgdigest").should be_nil
	end

	it "should return nil if no message and digest" do
		MagicKeyAuth::SSL.authenticate.should be_nil
	end

	it "should raise an error if no key dir" do
		MagicKeyAuth::SSL.key_location = nil
		lambda {
			MagicKeyAuth::SSL.authenticate
		}.should raise_error(MagicKeyAuth::InvalidKeyDir)
	end
end
