class Strike < Frame
    # In the frame where strike is rolled, add 10 to number of pins knocked down in next two rolls
    def score
        10 + @rolls[@roll_index + 1] + @rolls[@roll_index + 2]
    end

    # Strike strategy found when number of pins knocked down in first rolls of frame equals 10
    def self.found?(rolls, roll_index)
        rolls[roll_index].eql?(10)
    end

    # Override Frame type's number_of_rolls method
    def number_of_rolls(is_last_frame)
        # If the last frame starts with a strike, we get 2 bonus rolls
        is_last_frame ? 3 : 1
    end
end