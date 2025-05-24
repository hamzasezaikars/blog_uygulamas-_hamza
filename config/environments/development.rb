require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Development environment settings

  # Make code changes take effect immediately
  config.enable_reloading = true

  # Do not eager load code on boot
  config.eager_load = false

  # Show full error reports
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = {
      "cache-control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
  end

  # Use memory store for caching
  config.cache_store = :memory_store

  # Store uploaded files on the local file system
  config.active_storage.service = :local

  # Ignore mailer delivery errors
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Log deprecation notices
  config.active_support.deprecation = :log

  # Raise an error if there are pending migrations
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs
  config.active_record.verbose_query_logs = true
  config.active_record.query_log_tags_enabled = true

  # Highlight code that enqueued background jobs in logs
  config.active_job.verbose_enqueue_logs = true

  # Annotate rendered view with file names
  config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error when a before_action's only/except options reference missing actions
  config.action_controller.raise_on_missing_callback_actions = true

  # Uncomment to allow Action Cable access from any origin
  # config.action_cable.disable_request_forgery_protection = true

  # Uncomment to raise error for missing translations
  # config.i18n.raise_on_missing_translations = true

  # Uncomment to enable RuboCop autocorrection after file generation
  # config.generators.apply_rubocop_autocorrect_after_generate!
end
