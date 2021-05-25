# frozen_string_literal: true

require "csv"

module CsvSimpleExport
  class Builder
    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def default_options
      {
        headers: columns_config.keys,
        write_headers: true
      }
    end

    def self.column(keyname, action = nil, &block)
      columns_config[keyname] = Action.new(keyname, action, &block)
    end

    def self.columns(*args)
      args.each do |key|
        column(key)
      end
    end

    def self.columns_config
      @columns_config ||= {}
    end

    def build
      CSV.generate do |csv|
        csv << default_options[:headers]
        collection.each do |record|
          csv << columns_config.values.map do |action|
            action.get_value(record, self)
          end
        end
      end
    end

    def self.build(collection)
      new(collection).build
    end

    protected

    def columns_config
      self.class.columns_config
    end
  end
end
