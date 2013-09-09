# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#UsrModel::Application.config.secret_key_base = #'c60bbadf813ab3f29963a9b25cf949e7cad33f0d586ea8d4e434a5250c67ea8218018eebfd3177f63f2640c63aae2563aade367f890eadce76e54460e542f2a7'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

UsrModel::Application.config.secret_key_base = secure_token
