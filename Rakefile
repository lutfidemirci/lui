Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'rubygems'
require 'bundler'

Bundler.require

$LOAD_PATH.unshift 'lib'
require 'lui'

Dir.glob('lib/tasks/*.rake').each do |task|
  import task
end
