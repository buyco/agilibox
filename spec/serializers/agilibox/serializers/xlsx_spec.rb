require "rails_helper"

RSpec.describe Agilibox::Serializers::Xlsx do
  # rubocop:disable Style/WordArray
  let(:data) {
    [
      ["Name", "Age"],
      ["Benoit", 27],
    ]
  }
  # rubocop:enable Style/WordArray

  let(:serializer) {
    Agilibox::Serializers::Xlsx.new(data)
  }

  let(:tempfile) { Tempfile.new(["xlsx", ".xlsx"]) }

  describe "#render_inline" do
    it "should return xlsx content" do
      str = serializer.render_inline
      expect(str).to include "workbook"
      expect(str).to include "worksheet"
      expect(str).to include "xml"
    end
  end

  describe "#render_file" do
    it "should write xlsx content" do
      serializer.render_file(tempfile)
      file_content = File.open(tempfile, "rb").read
      expect(file_content).to eq serializer.render_inline
    end
  end

  describe "in real life" do
    xit "open it in Excel" do
      data = {
        "Integer"  => 123,
        "Decimal"  => (0.1 + 0.2),
        "True"     => true,
        "False"    => false,
        "Date"     => Date.current,
        "DateTime" => Time.zone.now,
        "nil"      => nil,
        "String"   => "i'm a string",
        "Object"   => described_class,
      }.to_a

      described_class.new(data).render_file(tempfile)
      Launchy.open(tempfile.path)
      sleep 60 # let Launchy open file before deleting it
    end
  end
end
