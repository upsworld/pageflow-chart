require 'paperclip'
require 'state_machine'
require 'state_machine_job'

require 'pageflow/chart/engine'

module Pageflow
  module Chart
    def self.config
      @config ||= Chart::Configuration.new
    end

    def self.configure(&block)
      block.call(config)
    end
  end
end
