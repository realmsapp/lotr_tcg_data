module LotrTcgData
  class CardType
    extend Concerns::WithLocalData.new(path: "card_types.yml")
    include Strict::Value

    attributes do
      key String
      name String
      min Integer
      max Integer
      attributes ArrayOf(Keyword), default: []
    end
  end
end