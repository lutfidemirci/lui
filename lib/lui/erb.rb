module Lui
  class ERB
    def self.render(type, data)
      data = {} if data.nil?
      if type == :index
        return ""
      elsif type == :post
        layout_file   = File.read('views/layout.erb')
        layout_eruby  = Erubis::Eruby.new(layout_file)
        content_file  = File.read('views/post.erb')
        layout_data   = {}
        layout_data["content"] = content_file
        return layout_eruby.result(layout_data)
      elsif type == :post_summary
        return ""
      else
        return ""
      end
    end
  end
end