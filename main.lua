function love.load()
	VW = 600
	VH = 600
	love.window.setMode(VW, VH)

	cellWidth = VW/3
	cellHeight = VH/3

	board = {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}
	selected = {x = 0, y = 0}
end

local function clamp(n)
	local min = 0
	local max = 2
	return math.min(max, math.max(min, n))
end

function love.keypressed(key)
	if key == 'h' or key == 'left' then
		selected.x = clamp(selected.x - 1)
	elseif key == 'j' or key == 'down' then
		selected.y = clamp(selected.y + 1)
	elseif key == 'k' or key == 'up' then
		selected.y = clamp(selected.y - 1)
	elseif key == 'l' or key == 'right' then
		selected.x = clamp(selected.x + 1)
	elseif key == 'return' then
		local x = selected.x + 1
		local y = selected.y + 1
		local currentValue = board[x][y]
		board[x][y] = (currentValue == 0 and 1) or 0
	end
end

function love.update(dt)
end

local function drawCircle(x, y)
	love.graphics.push("all")
	love.graphics.setLineWidth(2)
	love.graphics.circle('line', (x*cellWidth+cellWidth/2), (y*cellHeight+cellHeight/2), cellWidth*0.25)
	love.graphics.pop()
end

local function drawCross(x, y)
	love.graphics.push("all")
	love.graphics.setLineWidth(2)
	love.graphics.line(x*cellWidth+cellWidth*0.25, y*cellHeight+cellHeight*0.25, x*cellWidth+cellWidth*0.75, y*cellHeight+cellHeight*0.75)
	love.graphics.line(x*cellWidth+cellWidth*0.25, y*cellHeight+cellHeight*0.75, x*cellWidth+cellWidth*0.75, y*cellHeight+cellHeight*0.25)
	love.graphics.pop()
end

local function drawCursor(x, y)
	local offset = 5
	love.graphics.rectangle('line', x*cellWidth+offset, y*cellHeight+offset, cellWidth-(offset*2), cellHeight-(offset*2))
end

function love.draw()
	for x=0,2 do
		for y=0,2 do
			love.graphics.rectangle('line', x*cellWidth, y*cellHeight, cellWidth, cellHeight)

			local gridValue = board[x+1][y+1]
			if gridValue == 1 then
				drawCross(x, y)
			end

			if x == selected.x and y == selected.y then
				drawCursor(x, y)
			end
		end
	end
end
