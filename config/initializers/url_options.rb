Rails.application.routes.default_url_options = {
  host: ENV.fetch('HOST') { 'localhost' },
  port: ENV.fetch('PORT') { 3000 }
}
