module Lui
  class System
    def self.run(cmd)
      `#{cmd}`
    end
  end
end