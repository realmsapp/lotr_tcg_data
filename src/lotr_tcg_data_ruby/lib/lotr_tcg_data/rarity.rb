module LotrTcgData
  class Rarity
    extend Concerns::WithLocalData.new(path: "rarities.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end