Sentry.init do |config|
  config.dsn = 'https://c10e237931e64e41ac35152da0067acf@o4505362171428864.ingest.sentry.io/4505362174771200'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 0.1
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end if ENV['RAILS_ENV'] == 'production'
