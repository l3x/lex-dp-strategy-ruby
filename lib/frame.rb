class Frame
    def initialize(rolls, roll_index)
        @rolls = rolls            # Array of rolls, where each equates to number of pins knocked down in that roll
        @roll_index = roll_index  # The first roll index in this frame
    end

    def score
        @rolls[@roll_index] + @rolls[@roll_index + 1]  # Sum of both rolls in frame
    end

    def self.found?(rolls, roll_index)
        true  # If neither Spare or Strike then this is a regular Frame
    end

    def number_of_rolls(is_last_frame)
        2  # Default to 2 rolls (regardless of whether it's last frame)
    end
end