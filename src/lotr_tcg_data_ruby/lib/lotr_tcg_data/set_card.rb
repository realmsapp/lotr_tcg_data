module LotrTcgData
  class SetCard
    class ParseError < StandardError; end

    include Concerns::WithRealmsYaml.new(as_text: [:game_text, :flavor_text])
    include Strict::Value

    attributes do
      key String
      name String
      title AnyOf(String, nil), default: nil
      subtitle AnyOf(String, nil), default: nil
      set Set
      rarity Rarity
      card_type CardType
      subtype Subtype
      alignment Alignment
      culture Culture
      signet Signet
      variants ArrayOf(Variant), default: []

      strength AnyOf(String, nil), default: nil
      vitality AnyOf(String, nil), default: nil
      twilight AnyOf(String, nil), default: nil
      resistance AnyOf(String, nil), default: nil
      resistance AnyOf(String, nil), default: nil
      unique? Boolean(), default: false
      ring_bearer? Boolean(), default: false
      site_number AnyOf(String, nil), default: nil
      site_home AnyOf(String, nil), default: nil

      game_text AnyOf(String, nil), default: nil
      flavor_text AnyOf(String, nil), default: nil
      notes AnyOf(String, nil), default: nil
      wiki_url AnyOf(String, nil), default: nil
    end

    def self.load(data)
      SetCard.new(
        key: data.fetch(:key),
        set: Set.fetch(data.fetch(:set_key)),
        card_type: CardType.fetch(data.fetch(:card_type_key)),
        subtype: Subtype.fetch(data.fetch(:subtype_key, "none")),
        alignment: Alignment.fetch(data.fetch(:alignment_key, "none")),
        culture: Culture.fetch(data.fetch(:culture_key, "none")),
        rarity: Rarity.fetch(data.fetch(:rarity_key, "none")),
        signet: Signet.fetch(data.fetch(:signet_key, "none")),
        variants: data.fetch(:variant_keys, []).map { |variant_key| Variant.load(variant_key) },

        name: data.fetch(:name),
        title: data.fetch(:title, nil),
        subtitle: data.fetch(:subtitle, nil),
        strength: data.fetch(:strength, nil),
        vitality: data.fetch(:vitality, nil),
        twilight: data.fetch(:twilight, nil),
        resistance: data.fetch(:resistance, nil),
        unique?: data.fetch(:unique?, false),
        ring_bearer?: data.fetch(:ring_bearer?, false),
        site_number: data.fetch(:site_number, nil),
        game_text: data.fetch(:game_text, nil),
        flavor_text: data.fetch(:flavor_text, nil),
        notes: data.fetch(:notes, nil),
        wiki_url: data.fetch(:wiki_url, nil),
      )
    rescue => e
      raise ParseError, data
    end
  end
end