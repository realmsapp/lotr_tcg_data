module LotrTcgData
  class Culture
    extend Concerns::WithLocalData.new(path: "cultures.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end