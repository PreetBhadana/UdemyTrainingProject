module TwilioMessage
  # Download the helper library from https://www.twilio.com/docs/ruby/install
  require 'rubygems'
  require 'twilio-ruby'

  # Find your Account SID and Auth Token at twilio.com/console
  # and set the environment variables. See http://twil.io/secure
  def send_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
        body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
        from: twilio_number,
        to: '+919811421176'
      )

    puts message.sid
  end
end