# frozen_string_literal: true

module CsvSimpleExport
  RSpec.describe Builder do
    describe "#csv_simple_export" do
      context "Example 1" do
        let(:exporter) do
          Class.new(CsvSimpleExport::Builder) do
            column "Name", :name
          end
        end
        let(:record) do
          Class.new do
            def name
              "John Doe"
            end
          end
        end
        it do
          expect(exporter.build([record.new])).to eql("Name\nJohn Doe\n")
        end
      end
    end
  end
end
