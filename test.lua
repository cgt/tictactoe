lu = require 'luaunit'

local function winner(board)
	for row, columns in ipairs(board) do
		if columns[1] ~= '' and columns[1] == columns[2] and columns[2] == columns[3] then
			return columns[1]
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
end

os.exit(lu.LuaUnit.run())
