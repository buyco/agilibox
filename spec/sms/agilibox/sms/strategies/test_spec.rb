require "rails_helper"

describe Agilibox::Sms::Strategies::Test do
  before do
    described_class.deliveries.clear
  end

  let(:sms) {
    {to: "09 88 77 66 55", body: "Hello !"}
  }

  it "should add sms to deliveries" do
    expect {
      described_class.new(sms).deliver_now
    }.to change(described_class.deliveries, :count).by(1)

    expect(described_class.deliveries.first).to eq sms
  end
end
