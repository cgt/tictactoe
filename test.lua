lu = require 'luaunit'

local function winner(board)
	for row, columns in ipairs(board) do
		if columns[1] == 'X' and columns[3] == 'X' then
			return 'X'
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
end

os.exit(lu.LuaUnit.run())
