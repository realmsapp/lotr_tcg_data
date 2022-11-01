module LotrTcgData
  module Concerns
    class WithRealmsYaml < Module
      def initialize(omit: [], as_text: [])
        define_method(:to_realms_attributes) do
          to_h.each_with_object({}) do |(key, value), memo|
            sanitized_key = key.to_s.delete_suffix("?").to_sym
            if value.respond_to?(:key)
              memo[sanitized_key] = value.key unless value.key == "none"
            elsif value.is_a?(Array) && value.all? { |a| a.respond_to?(:key) }
              memo[sanitized_key] = value.map { |v| v.key unless v.key == "none" }.compact
            else
              memo[sanitized_key] = value unless value.blank?
            end
          end
        end

        define_method(:to_realms_yaml) do
          attributes = to_realms_attributes
          attributes.slice(*as_text).each do |k,v|
            attributes[k] = LiteralScalar.new(v.delete("\r")) if v.present?
          end
          YAML.dump(attributes.except(*omit).stringify_keys)
        end

        define_method(:to_realms_json) do
          attributes = to_realms_attributes
          JSON.dump(attributes.except(*omit).stringify_keys)
        end
      end
    end

    private

    class LiteralScalar
      attr_reader :str

      def initialize(str)
        @str = str
      end

      def blank?
        str.blank?
      end

      def encode_with(coder)
        coder.style = Psych::Nodes::Scalar::LITERAL
        coder.scalar = str
        coder.tag = nil
      end
    end
  end
end