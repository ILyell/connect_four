require "spec_helper"

RSpec.describe Player do
  describe "#initialize" do
    it "exists and has readable attributes" do
      player_1 = Player.new("Ethan", :ply_1)
      player_2 = Player.new("AI", :ply_2, true)

      expect(player_1.name).to eq("Ethan")
      expect(player_1.p1_or_p2).to eq(:ply_1)
      
      expect(player_2.name).to eq("AI")
      expect(player_2.p1_or_p2).to eq(:ply_2)
    end
  end

  describe "#is_cpu?" do
    it "is not a CPU by default" do
      player_1 = Player.new("Ethan", :ply_1)
      player_2 = Player.new("AI", :ply_2, true)

      expect(player_1.is_cpu?).to be false
      expect(player_2.is_cpu?).to be true
    end
  end
end
