module MagicKeyAuth
	class Message
		attr_accessor :keyfile, :message

		def initialize(opts = {})
			self.message = (opts[:message] || Time.now.to_i).to_s
			self.keyfile = opts[:keyfile].to_s
		end

		def digest
			raise MagicKeyAuth::NoKeyFound unless File.exists?(self.keyfile)
			EzCrypto::Signer.from_file(self.keyfile).sign(self.message)
		end
	end
end
