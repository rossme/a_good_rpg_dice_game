require "./lib/game"

RSpec.configure do |config|
  config.before(:all) do
    @original_stdout = $stdout
    @original_stdin = $stdin
    $stdout = File.open(File::NULL, "w")
  end

  config.after(:all) do
    $stdout = @original_stdout
  end
end

RSpec.describe Game do
  let(:sides) { 6 }
  let(:hp) { 20 }
  let(:game) { described_class.new(sides: sides, hp: hp) }

  it "determines a winner" do
    player1 = game.player1

    allow(game).to receive(:roll_dice).and_return(20, 0)
    allow(game).to receive(:gets).and_return("\n", "\n")

    game.play

    expect(game.winner).to eq(player1)
  end

  it "reduces defender's HP when attack roll is higher" do
    allow(game).to receive(:roll_dice).and_return(6, 1)
    allow(game).to receive(:gets).and_return("\n", "\n")

    game.send(:battle)

    expect(game.player2.hp).to eq(15)
  end

  it "initializes with two players" do
    expect(game.players.size).to eq(2)
    expect(game.player1.hp).to eq(20)
    expect(game.player2.hp).to eq(20)
  end
end
