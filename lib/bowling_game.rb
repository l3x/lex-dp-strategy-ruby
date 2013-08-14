class BowlingGame
    NUMBER_OF_FRAMES = 10

    # BowlingGame.new(Strike, Spare, Frame)
    def initialize(*policies)
        @policies = policies  # Each Frame type has different policies used for scoring
        @rolls = []           # Array of rolls (number of pins knocked down)
    end

    # Add number of pins knocked down to @rolls array
    def roll(pins_knocked_down)
        @rolls << pins_knocked_down
    end

    # Sum each frame's score for total
    # See: http://lexsheehan.blogspot.com/search?q=functional+programming
    def score
        frames.reduce(0) { |sum, frame| sum + frame.score }
    end

    # A frame consists of two rolls, unless first roll is a Strike (special rules for last frame)
    def frames
        roll_index = 0
        frames = []
        NUMBER_OF_FRAMES.times do |i|
            frames << frame(roll_index)
            # Polymorphism: Frames could be a Strike or a Spare, both of which have a number_of_rolls method
            # Spare has 2 rolls and Strike has 1 roll
            is_last_frame = i.eql?(NUMBER_OF_FRAMES - 1)  # Last frame gets bonus roll(s)
            roll_index += frames.last.number_of_rolls(is_last_frame)
        end
        frames
    end

    # Use strategy pattern to select appropriate Frame type (regular Frame, Spare or Strike)
    # See:  http://en.wikipedia.org/wiki/Strategy_pattern
    def frame(roll_index)
        @policies.each do |policy|
            # Select frame based on policy in found? methods
            return policy.new(@rolls, roll_index) if policy.found?(@rolls, roll_index)
        end
    end

end
