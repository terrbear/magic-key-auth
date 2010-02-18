require 'rake'

Gem::Specification.new do |s|
  s.name     = "magic_key_auth"
  s.version  = "0.1"
  s.date     = "18Feb2010"
  s.summary  = "authentication mechanism based on SSH keys"
  s.email    = "theath@gmail.com"
  s.homepage = "http://github.com/terrbear/magic_key_auth"
  s.description = "authentication mechanism based on SSH keys"
  s.has_rdoc = false
  s.authors  = ["Terry Heath"]
  s.files    = FileList[ 
												"lib/magic_key_auth.rb", 
												"lib/magic_key_auth/*.rb",
												].to_a
	s.require_path = 'lib'
  s.add_dependency("ezcrypto", [">= 0.7.2"])

	s.requirements << "ezcrypto, 0.7.2 or later"
end
