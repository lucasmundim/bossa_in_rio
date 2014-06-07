BossaInRio::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enabling serve static assets
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=2592000" # caches assets by 1 month

  # Compress JavaScripts and CSS
  config.assets.compress = true
  config.assets.css_compressor = :yui

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )
  config.assets.precompile += %w( admin_application.js )
  config.assets.precompile += %w( admin_application.css )

  # Enabling rack-cache
  cache_servers = (ENV["MEMCACHIER_SERVERS"] || "").split(",")
  cache_options = {
    username: ENV["MEMCACHIER_USERNAME"],
    password: ENV["MEMCACHIER_PASSWORD"],
    compress: true,
    failover: true,
    socket_timeout: 1.5,
    socket_failure_delay: 0.2,
    value_max_bytes: 10485760
  }

  # Use a different cache store in production.
  config.cache_store = :dalli_store, cache_servers, cache_options

  client = Dalli::Client.new(cache_servers, cache_options)

  config.action_dispatch.rack_cache = {
    metastore: client,
    entitystore: client
  }

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'] || '',       # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'] || '',       # required
      :region                 => ENV['S3_REGION']  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET'] || 'bossainrio'                     # required
  end

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => ENV['SMTP_DOMAIN'],
    :user_name            => ENV['SMTP_USERNAME'],
    :password             => ENV['SMTP_PASSWORD'],
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
end
