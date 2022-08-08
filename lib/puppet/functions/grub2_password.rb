require 'openssl'

# @summary Generates GRUB 2 PBKDF2 hashes
Puppet::Functions.create_function(:grub2_password) do
  # @param password
  #   The password string to hash
  #
  # @param salt
  #   A hash salt to use
  #
  # @param rounds
  #   The number of rounds to use
  #
  # @return [String]
  dispatch :grub2_password do
    required_param 'String', :password
    optional_param 'String', :salt
    optional_param 'Integer', :rounds
  end

  def grub2_password(password, salt = nil, rounds = 10_000)
    salt ||= (0...63).map { |_x| (65 + rand(26)).chr }.join
    digest = OpenSSL::Digest::SHA512.new
    hashed_password = OpenSSL::PKCS5.pbkdf2_hmac(password, salt, rounds, digest.digest_length, digest).unpack('H*').first.upcase

    "grub.pbkdf2.sha512.#{rounds}.#{unpack_salt(salt)}.#{hashed_password}"
  end

  def pack_salt(salt)
    salt.scan(%r{..}).map { |x| x.hex }.pack('c*')
  end

  def unpack_salt(salt)
    salt.unpack('H*').first.upcase
  end
end
