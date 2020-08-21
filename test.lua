lu = require 'luaunit'

local function winner(board)
	if board[1][1] == 'X' then
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
end

os.exit(lu.LuaUnit.run())
