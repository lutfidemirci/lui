module Lui
  module Markdown
    def self.render(markdown)
      return '' unless markdown and markdown.length > 0
      options = {
        no_intra_emphasis: true,
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: true,
        space_after_headers: true,
        superscript: true
      }
      markdown_renderer = Redcarpet::Markdown.new(Lui::Markdown::HTMLRenderer, options)
      markdown_renderer.render(markdown)
    end

    class HTMLRenderer < Redcarpet::Render::HTML
      def block_code(code, language)
        if language
          Pygments.highlight(code, lexer: language.to_sym)
        else
          "<pre>#{code}</pre>"
        end
      end
    end
  end
end