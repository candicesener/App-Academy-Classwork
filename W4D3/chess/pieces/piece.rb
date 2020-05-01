class Piece
    attr_reader :board, color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos

        board.add_piece(self, pos)
    end

    def to_s
        " #{symbol} "
    end

  


end


