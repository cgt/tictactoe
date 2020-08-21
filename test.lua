lu = require 'luaunit'

local function winner(board)
	return nil
end

function testWinDetection()
	emptyBoard = {
		{'', '', '',},
		{'', '', '',},
		{'', '', '',},
	}
	lu.assertNil(winner(emptyBoard))
end

os.exit(lu.LuaUnit.run())
