lu = require 'luaunit'

local function winner(board)
	for row, columns in ipairs(board) do
		if columns[1] ~= '' and columns[1] == columns[2] and columns[2] == columns[3] then
			return columns[1]
		end
	end
	if board[1][1] ~= '' and board[1][1] == board[2][1] and board[2][1] == board[3][1] then
		return board[1][1]
	end
	for i=1,3 do
		if board[1][i] ~= '' and board[1][i] == board[2][i] and board[2][i] == board[3][i] then
			return board[1][i]
		end
	end
	return nil
end

function testWinDetection()
	emptyBoard = {
		{'', '', ''},
		{'', '', ''},
		{'', '', ''},
	}
	lu.assertNil(winner(emptyBoard))

	fullRow = {
		{'X', 'X', 'X'},
		{'', '', ''},
		{'', '', ''},
	}
	lu.assertEquals(winner(fullRow), 'X')

	fullRow2 = {
		{'', '', ''},
		{'X', 'X', 'X'},
		{'', '', ''},
	}
	lu.assertEquals(winner(fullRow2), 'X')

	fullRow3 = {
		{'', '', ''},
		{'', '', ''},
		{'X', 'X', 'X'},
	}
	lu.assertEquals(winner(fullRow3), 'X')

	twoMovesNoWinner = {
		{'', '', ''},
		{'', '', ''},
		{'X', 'X', ''},
	}
	lu.assertNil(winner(twoMovesNoWinner))

	twoMovesNoWinner2 = {
		{'', '', ''},
		{'', '', ''},
		{'X', '', 'X'},
	}
	lu.assertNil(winner(twoMovesNoWinner2))

	fullRowO = {
		{'O', 'O', 'O'},
		{'', '', ''},
		{'', '', ''},
	}
	lu.assertEquals(winner(fullRowO), 'O')

	fullColumn = {
		{'O', '', ''},
		{'O', '', ''},
		{'O', '', ''},
	}
	lu.assertEquals(winner(fullColumn), 'O')

	fullMiddleColumn = {
		{'', 'O', ''},
		{'', 'O', ''},
		{'', 'O', ''},
	}
	lu.assertEquals(winner(fullMiddleColumn), 'O')
end

os.exit(lu.LuaUnit.run())
