desc 'Send to gmail'
task :gmail do

  options = { :address              => 'smtp.gmail.com',
              :port                 => 587,
              # :domain               => 'your.host.name',
              :user_name            => App.config['gmail']['user_name'],
              :password             => App.config['gmail']['password'],
              :authentication       => 'plain',
              :enable_starttls_auto => true  }

  Mail.defaults do
    delivery_method :smtp, options
  end

  mail = Mail.new do
    from    App.config['gmail']['user_name']
    to      App.config['gmail']['recipient']

    subject 'This is a test email'

    html_text = File.read(File.join(App.root, 'emails/test.html'))
    plain_text = Nokogiri.HTML(html_text).text

    text_part do
      body plain_text
    end

    html_part do
      content_type 'text/html; charset=UTF-8'
      body html_text
    end
  end

  mail.deliver!

  puts 'Your message has been sent.'
end