# For webhooks to work, we need to be able to disable automatic POST parameter parsing.
# borrowed from https://kzar.co.uk/blog/2011/05/09/stop-rails-trying-to-parse-the-post-put-request-body/
class NoParse
  def initialize(app, options={})
    @app = app
    @urls = options[:urls]
  end

  def call(env)
    env['CONTENT_TYPE'] = 'text/plain' if @urls.include? env['PATH_INFO']
    @app.call(env)
  end
end
