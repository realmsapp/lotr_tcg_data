module LotrTcgData
  class Variant
    include Strict::Value

    attributes do
      set_card_key String
      finish
      feature
    end

    def key
      @key ||= begin
        parts = []
        parts << set_card_key
        parts << finish.code
        parts << feature.code unless feature.none?
        parts.join("-")
      end
    end

    def self.load(key)
      set_card_key, finish_key, feature_key = key.split("-")
      finish = PrintFinish.lookup.values.index_by(&:code).fetch(finish_key)
      feature = PrintFeature.lookup.values.index_by(&:code).fetch(feature_key || "N")
      new(set_card_key:, finish:, feature:)
    end
  end
end