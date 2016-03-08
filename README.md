Example Rails application using [Simplify](https://www.simplify.com).

For more details, please read the [Ruby on Rails tutorial](https://www.simplify.com/commerce/docs/examples/ruby-on-rails).

Enter you Simplify keys by creating a file config/application.yml

and enter the lines:

    simplify_public_key: "YOUR-PUBLIC-KEY"
    simplify_private_key: "YOUR-PRIVATE-KEY"

Also put in your public key into app/assets/javascripts/payment.js.coffee

To test webhooks, after loggining into simplify.com go to your account settings -> webhooks and add an appropriate entry for http://YOUR.SERVER.HOST/webhook/index

If you're using Rails 3 intead of Rails 4, you'll need to tweak webhook_controller.rb (see its comments)
