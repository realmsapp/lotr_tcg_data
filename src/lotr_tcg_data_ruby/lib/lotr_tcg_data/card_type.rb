module LotrTcgData
  class CardType
    extend Concerns::WithLocalData.new(path: "card_types.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end