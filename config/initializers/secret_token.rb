# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
BossaInRio::Application.config.secret_token = '7200c0e3adac5cd040c369d7159f956b4a7f02fdbdd1b5603f30412e4880df740ba1d666d2188b2b8d883fe133d8dad6f7ab3e6713a8def7aac2c700d206f96d'

BossaInRio::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test? # generate simple key for test and development environments
  ('a' * 30) # should be at least 30 chars long
else
  ENV['SECRET_TOKEN']
end
