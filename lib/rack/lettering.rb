require 'rack'
require 'nokogiri'

module Rack
  class Lettering

    def initialize(app, options = {})
      @app      = app
      @words    = options[:words] || []
      @letters  = options[:letters] || []
      @lines    = options[:lines] || []
    end

    def call(env)
      status, @headers, @body = @app.call(env)

      if html?
        apply_lettering
        update_content_length
      end

      [status, @headers, @body]
    end

    private

    def apply_lettering
      apply_word_rules
      apply_letter_rules
      apply_line_rules

      @body = document.to_html
    end

    def apply_word_rules
      @words.each do |word|
        document.css(word.strip).each do |node|
          content = []
          node.inner_html.split(' ').each_with_index do |text, index|
            content << span(text, 'word', index+1)
          end
          node.inner_html = content.join(' ')
        end
      end
    end

    def apply_letter_rules
      @letters.each do |letter|
        document.css(letter.strip).each do |node|
          content = ''
          node.content.chars.each_with_index do |text, index|
            content << span(text, 'char', index+1)
          end
          node.inner_html = content
        end
      end
    end

    def apply_line_rules
      @lines.each do |line|
        document.css(line.strip).each do |node|
          content = ''
          node.inner_html.split(/\n/).reject { |t| t.empty? }.each_with_index do |text, index|
            content << span(text, 'line', index+1)
          end
          node.inner_html = content
        end
      end
    end

    def span(content, classname, count)
      "<span class=\"#{classname}#{count}\">#{content}</span>"
    end

    def document
      @doc ||= Nokogiri::HTML.parse(@body)
    end

    def html?
      @headers["Content-Type"] && @headers["Content-Type"].include?("text/html")
    end

    def update_content_length
      @headers['Content-Length'] = Rack::Utils.bytesize(@body).to_s
    end
  end
end