require 'paxmex/schema/field'

module Paxmex
  class Schema
    class Section
      BLOCK_LENGTH = 450

      attr_reader :key, :data, :parent_key

      def initialize(key, data)
        @parent_key = data.delete('PARENT') { nil }
        @key = key
        @data = data
      end

      def recurring?
        !!data['RECURRING']
      end

      def abstract?
        !!data['ABSTRACT']
      end

      def trailer?
        !!data['TRAILER']
      end

      def child?
        !!@parent_key
      end

      def fields
        @fields ||= data['FIELDS'].map do |field|
          Paxmex::Schema::Field.new(
            name: field['NAME'],
            start: field['RANGE'].first,
            final: field['RANGE'].last,
            type: field['TYPE']
          )
        end
      end

      def types
        data['TYPES']
      end

      def type_field
        data['TYPE_FIELD']
      end

      def type_mapping
        data['TYPE_MAPPING']
      end

      def section_for_type(type)
        sections_for_types.detect { |t| t.key == type_mapping[type] }
      end

      def length
        BLOCK_LENGTH
      end

      def sections_for_types
        @sections_for_types ||= types.map { |k, v| self.class.new(k, v) }
      end
    end
  end
end
