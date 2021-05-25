# frozen_string_literal: true

require "csv_simple_export"

CsvSimpleExport::Main.new.csv_simple_export("input")

exporter = Class.new(CsvSimpleExport::Builder) do
  column "Name", :name
end

record = Class.new do
  def name
    "John Doe"
  end
end

exporter.build([record.new])
