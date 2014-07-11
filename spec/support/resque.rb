RSpec.configure do |config|
  config.before(:each, :inline_resque => true) do
    Resque.inline = true
  end

  config.after(:each, :inline_resque => true) do
    Resque.inline = false
  end
end

log_dir = Rails.root.join('log', 'jobs-test', Rails.env)
FileUtils.mkdir_p(log_dir)

Resque.logger_config = {
  folder: log_dir,
  class_name: Logger,
  class_args: [ 'daily', 1.kilobyte ],
  level:      Logger::INFO,
  formatter:  Logger::Formatter.new
}
