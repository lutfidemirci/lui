require 'lui/helper'
require 'lui/system'
require 'lui/logger'
require 'lui/markdown'
require 'lui/erb'

module Lui
  def self.redis
    Redis.new
  end
end