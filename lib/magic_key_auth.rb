
require File.join(File.dirname(__FILE__), "magic_key_auth", "ssl")
require File.join(File.dirname(__FILE__), "magic_key_auth", "message")

class MagicKeyAuth::InvalidKeyDir < StandardError; end
class MagicKeyAuth::NoKeyFound < StandardError; end
