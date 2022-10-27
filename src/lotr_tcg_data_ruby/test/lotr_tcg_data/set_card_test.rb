require_relative "./../test_helper"

describe LotrTcgData::SetCard do
  it "fails" do
    yaml = LotrTcgData.read_local("set_cards/001_fellowship_of_the_ring/1C2.yml")
    parsed = LotrTcgData.load_local("set_cards/001_fellowship_of_the_ring/1C2.yml")
    set_card = LotrTcgData::SetCard.load(parsed.symbolize_keys)
    expect(set_card.name).must_equal("The One Ring, The Ruling Ring")

    generated_yaml = set_card.to_realms_yaml
    expect(generated_yaml).must_equal(yaml)

    generated_json = set_card.to_realms_json
    expect(generated_json).must_equal(JSON.generate(parsed))
  end
end