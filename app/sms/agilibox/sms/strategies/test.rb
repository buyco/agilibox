class Agilibox::Sms::Strategies::Test < Agilibox::Sms::Strategies::Base
  def self.deliveries
    @deliveries ||= []
  end

  private

  def call
    self.class.deliveries << data
    Rails.logger.info "New SMS sent : #{data.inspect}"
  end
end
