require 'ezsig'

module MagicKeyAuth
	class SSL
		class << self
			def key_location=(dir)
				@key_location = dir
			end

			def key_location
				@key_location || "keys"
			end

			def authenticate(opts = {})
				opts = {:digest => "", :message => Time.now.to_i.to_s}.merge(opts)
				raise MagicKeyAuth::InvalidKeyDir, "key directory doesn't exist!" unless File.exists?(key_location)
				Dir.new(key_location).entries.each do |key|
					next unless key =~ /\.pem/
					return key.gsub(/\.pem/, '') if 
						(EzCrypto::Verifier.from_file(File.join(key_location, key)).verify(opts[:digest], opts[:message]) rescue false)
				end
				nil
			end
		end
	end
end
