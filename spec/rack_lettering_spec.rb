require 'spec_helper'

describe Rack::Lettering do

  context 'text/html requests' do
    before(:each) do
      body = fixture('atlantis.html')

      @letter_selectors = ["#txt_below", "#txt_date", "#txt_worldsfair", "#txt_welcomesignvert"]
      @word_selectors = ["#txt_imaginationflag", "#txt_countdown", "#txt_worldsfaircircle", "#txt_gowiththeflow", "#youarehere"]
      @line_selectors = ["#txt_gillsorlungs", "#txt_sealand", "#txt_bubbles", "#subwaymap", "#txt_adspace", "#txt_attnatlantesians", ".corner"]

      options = {
        :letters => @letter_selectors,
        :words => @word_selectors,
        :lines => @line_selectors
      }

      @app = lambda { |env| [200, {'Content-Type' => 'text/html', 'Content-Length'=> '123'}, body] }
      @request = Rack::MockRequest.env_for("/")
      @response = Rack::Lettering.new(@app, options).call(@request)

      @response_headers = @response[1]
      @response_body = @response[2]

      @document = Nokogiri::HTML.parse(@response_body)
    end

    it 'should wrap letters inside letter spans' do
      @letter_selectors.each do |selector|
        @document.css(selector).should have_css_selector('.char1')
      end
    end

    it 'should wrap words inside word spans' do
      @word_selectors.each do |selector|
        @document.css(selector).should have_css_selector('.word1')
      end
    end

    it 'should wrap lines inside line spans' do
      @line_selectors.each do |selector|
        @document.css(selector).should have_css_selector('.line1')
      end
    end

    it 'should update the content_length header' do
      @response_headers['Content-Length'].should_not eq('123')
    end
  end

  context 'non text/html requests' do
    before(:all) do
      @body = "{'foo':'bar'}"
      @app = lambda { |env| [200, {'Content-Type' => 'application/json'}, @body] }
      @request = Rack::MockRequest.env_for("/")
      @response_body = Rack::Lettering.new(@app).call(@request).last
    end

    it "should not modify the response body" do
      @response_body.should eq(@body)
    end
  end

end