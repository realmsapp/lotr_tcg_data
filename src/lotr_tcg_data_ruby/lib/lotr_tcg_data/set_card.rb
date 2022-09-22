module LotrTcgData
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
      title Either(String, nil), default: nil
      subtitle Either(String, nil), default: nil
      strength Either(String, nil), default: nil
      vitality Either(String, nil), default: nil
      twilight Either(String, nil), default: nil
      resistance Either(String, nil), default: nil
      resistance Either(String, nil), default: nil
      unique? Bool(), default: false
      ring_bearer? Bool(), default: false
      site_number Either(String, nil), default: nil

      game_text Either(String, nil), default: nil
      flavor_text Either(String, nil), default: nil
      notes Either(String, nil), default: nil
      wiki_url Either(String, nil), default: nil
    }
  end
end