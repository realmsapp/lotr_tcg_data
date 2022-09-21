module LotrTcgData
  module SetCards
    class SetCard
      include ValueSemantics.for_attributes {
        key String
        set Set
        rarity Rarity
        card_type CardType
        subtype Subtype
        alignment Alignment
        culture Culture
        signet Signet
        variants ArrayOf(Variant), default: []

        name String
        title Either(String, nil)
        subtitle Either(String, nil)
        strength Either(String, nil)
        vitality Either(String, nil)
        twilight Either(String, nil)
        resistance Either(String, nil)
        resistance Either(String, nil)
        unique? Bool()

        game_text Either(String, nil)
        flavor_text Either(String, nil)
        notes Either(String, nil)
        wiki_url Either(String, nil)
      }
    end
  end
end