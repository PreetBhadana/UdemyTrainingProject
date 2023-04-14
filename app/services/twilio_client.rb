class TwilioClient
  attr_reader :client
  
  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(phone, message)
    client.api.account.messages.create(
      to: phone,
      from: twilio_number,
      body: message
    )
  end

  def make_call(phone)
    begin
      @client.calls.create(
        from: twilio_number,
        to: phone,
        twiml: '<Response><Say>Ahoy, World!</Say></Response>',
      )
    rescue Twilio::REST::RestError => e
      puts e.message
    end
  end

  private
    def account_sid
      ENV['TWILIO_ACCOUNT_SID']
    end

    def auth_token
      ENV['TWILIO_AUTH_TOKEN']
    end

    def twilio_number
      ENV['TWILIO_NUMBER']
    end

end