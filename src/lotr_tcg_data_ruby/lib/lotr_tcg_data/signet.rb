module LotrTcgData
  class Signet
    extend Concerns::WithLocalData.new(path: "signets.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end