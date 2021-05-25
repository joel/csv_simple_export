# frozen_string_literal: true

module CsvSimpleExport
  RSpec.describe Action do
    describe "#csv_simple_export" do
      context "Example 1" do
        let(:record) do
          Class.new do
            def foo
              "foo"
            end
          end
        end

        subject { described_class.new(:foo) }
        it do
          expect(subject.get_value(record.new, self)).to eql("foo")
        end
      end
    end
  end
end
