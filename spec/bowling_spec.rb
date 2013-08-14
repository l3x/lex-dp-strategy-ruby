Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each do |file|
    puts "Requiring #{file}"
    require File.dirname(file) + '/' + File.basename(file, File.extname(file))
end

describe BowlingGame do

    let(:game) { BowlingGame.new(Strike, Spare, Frame) }

    it "scores 0 with a gutter ball game" do
        20.times { game.roll 0 }
        expect(game.score).to eq(0)
    end

    it "scores 20 with a single pin knocked down on each roll" do
        20.times { game.roll 1 }
        expect(game.score).to eq(20)
    end

    it "scores 20 with a spare in first frame and 5 in next roll (rest are gutter balls)" do
        game.roll 7
        game.roll 3
        game.roll 5
        17.times { game.roll 0 }
        expect(game.score).to eq(20)
    end

    it "scores 15 with a spare in last frame and 5 in bonus roll (rest are gutter balls)" do
        18.times { game.roll 0 }
        game.roll 7
        game.roll 3
        game.roll 5
        expect(game.score).to eq(15)
    end

    it "scores 26 with a strike in first roll and 5 in next roll (rest are gutter balls)" do
        game.roll 10
        game.roll 5
        game.roll 3
        17.times { game.roll 0 }
        expect(game.score).to eq(26)
    end

    it "scores 34 with 5, 3, strike and 5 in next roll (rest are gutter balls)" do
        game.roll 5
        game.roll 3
        game.roll 10
        game.roll 5
        game.roll 3
        15.times { game.roll 0 }
        expect(game.score).to eq(34)
    end

    it "scores 300 with all strikes" do
        12.times { game.roll 10 }
        expect(game.score).to eq(300)
    end

    it "scores 150 with all 5's" do
        21.times { game.roll 5 }
        expect(game.score).to eq(150)
    end

end

