module LotrTcgData
  class CardType
    extend Concerns::WithLocalData.new(path: "card_types.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
      min Integer
      max Integer
      attributes ArrayOf(Keyword), default: []
    }
  end
end