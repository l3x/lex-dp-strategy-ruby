class Spare < Frame
    # In the frame where strike is rolled, add 10 to number of pins knocked down in next frame's first roll
    def score
        10 + @rolls[@roll_index + 2]
    end

    # Spare strategy found when number of pins knocked down in both rolls of this frame equals 10
    def self.found?(rolls, roll_index)
        first_roll = rolls[roll_index] || 0
        # Note that there is no second roll when spare is scored in last frame
        second_roll = rolls[roll_index + 1] || 0
        (first_roll + second_roll).eql?(10)
    end

    # Override Frame type's number_of_rolls method
    def number_of_rolls(is_last_frame)
        # If the last frame is a spare, we get 1 bonus roll
        is_last_frame ? 3 : 2
    end
end