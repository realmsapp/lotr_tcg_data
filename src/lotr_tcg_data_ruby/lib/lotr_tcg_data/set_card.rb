module LotrTcgData
  class SetCard
    class ParseError < StandardError; end

    include Concerns::WithRealmsYaml.new(as_text: [:game_text, :flavor_text])
    include Concerns::Slugify
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

    def card_key
      to_slug(name)
    end

    def self.lookup(set_card_key:)
      path = Pathname.new(LotrTcgData.root_path).join("data/set_cards").glob("**/#{set_card_key}.yml")
      data = YAML.load(path.first.read)
      load(data.symbolize_keys)
    end

    def self.load(data)
      SetCard.new(
        key: data.fetch(:key),
        set: Set.fetch(data.fetch(:set)),
        card_type: CardType.fetch(data.fetch(:card_type)),
        subtype: Subtype.fetch(data.fetch(:subtype, "none")),
        alignment: Alignment.fetch(data.fetch(:alignment, "none")),
        culture: Culture.fetch(data.fetch(:culture, "none")),
        rarity: Rarity.fetch(data.fetch(:rarity, "none")),
        signet: Signet.fetch(data.fetch(:signet, "none")),

        name: data.fetch(:name),
        title: data.fetch(:title, nil),
        subtitle: data.fetch(:subtitle, nil),
        strength: data.fetch(:strength, nil),
        vitality: data.fetch(:vitality, nil),
        twilight: data.fetch(:twilight, nil),
        resistance: data.fetch(:resistance, nil),
        unique?: data.fetch(:unique, false),
        ring_bearer?: data.fetch(:ring_bearer, false),
        site_number: data.fetch(:site_number, nil),
        game_text: data.fetch(:game_text, nil),
        flavor_text: data.fetch(:flavor_text, nil),
        notes: data.fetch(:notes, nil),
        wiki_url: data.fetch(:wiki_url, nil),
        variants: data.fetch(:variants, []).map { |variant_key| Variant.load(variant_key) },
      )
    rescue => e
      raise ParseError, data
    end

    def rewrite(&block)
      File.write(pathname, to_realms_yaml)
    end

    def update(&block)
      with_updates = block.call(self)
      File.write(pathname, with_updates.to_realms_yaml)
    end

    def move(&block)
      FileUtils.mv(pathname, block.call(self))
    end

    def pathname
      set_dir = "#{set.number.to_s.rjust(3, "0")}_#{set.key}"
      Pathname.new(LotrTcgData.root_path).join("data/set_cards/#{set_dir}/#{key}.yml")
    end

    def self.all(&block)
      Pathname.new(LotrTcgData.root_path).glob("data/set_cards/**/*.yml").each do |file|
        set_card = lookup(set_card_key: File.basename(file, ".yml"))
        block.call(set_card)
      end
    end
  end
end