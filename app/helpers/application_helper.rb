module ApplicationHelper
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when ''
        # 空欄のままだと「Invalid id given:」エラー
        lang = 'md'
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    coderay_options = {
      hard_wrap:   true,
      filter_html: false,
    }

    redcarpet_options = {
      autolink:           true,
      tables:             true,
      fenced_code_blocks: true,
    }

    markdown = Redcarpet::Markdown.new(HTMLwithCoderay.new(coderay_options), redcarpet_options)
    markdown.render(text)
  end
end
