class WebhookController < ApplicationController

  # need to disable csrf check for webhook
  # see http://stackoverflow.com/a/5669355
  # Rails 3
  # skip_before_filter :verify_authenticity_token

  #Rails 4
  skip_before_action :verify_authenticity_token

  def index

    requestData = request.raw_post()

    event = Simplify::Event.create({'payload' => requestData})

    puts "Event name #{event['name']}"

    data = event['data']
    print data

    render text: "OK"
  end
end
