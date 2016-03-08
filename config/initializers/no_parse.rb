# (Change the :urls to specify which paths use NoParse.)
# Used so we don't try parse the webhook payload from Simplify 
Rails.configuration.middleware.insert_before('ActionDispatch::ParamsParser',
                                             'NoParse', :urls => ['/webhook/index'])
