module Lui
  class Helper
    def self.capitalize_words(string)
      string.split(' ').map {|w| w.capitalize }.join(' ')
    end
  end
end