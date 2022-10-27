module LotrTcgData
  class Variant
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end