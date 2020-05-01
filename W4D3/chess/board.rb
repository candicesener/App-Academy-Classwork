require_relative "pieces"

class Board
    attr_reader :grid, :sentinel

    def initialize(grid)
        @sentinel = NullPiece.instance
        @grid = Array.new(8) { Array.new(8, @sentinel) }
        initial_grid
    end

    def initial_grid
    
        [:white, :black].each do |color|
            back_row(color)
        end

    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def add_piece(piece, pos)
        raise "this position already has a piece" if self[pos].empty?

        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at the starting position" if self[start_pos].empty?

        piece = self[start_pos]

        self[end_pos] = piece
        self[start_pos] = self.sentinel
        piece.pos = end_pos

        nil

    end


    def back_row(color)
        pieces_in_order = ["♜", "♞", "♝", "♛", "♚", "♝", "♞", "♜"]

        if color == :white
            i = 0
            pieces_in_order.each_with_index do |piece, piece_index|
                piece.new(color, self, [i, piece_index] )
            end
        end 
        elsif color == :black
            i = 7
            pieces_in_order.each_with_index do |piece, piece_index|
                piece.new(color, self, [i, piece_index])
            end
        end

        
    end

end

