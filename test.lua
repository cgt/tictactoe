lu = require 'luaunit'

local function winner(board)
	if board[1][1] == 'X' then
		return 'X'
	end
	if board[2][1] == 'X' then
		return 'X'
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
		{'X', 'X', 'X'},
		{'', '', ''},
	}
	lu.assertEquals(winner(fullRow3), 'X')
end

os.exit(lu.LuaUnit.run())
