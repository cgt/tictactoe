function love.load()
	VW = 600
	VH = 600
	love.window.setMode(VW, VH)

	grid = {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}
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
	elseif key == 'enter' then
		local x = selected.x + 1
		local y = selected.y + 1
		grid[x][y] = grid[x][y] + 1
	end
end

function love.update(dt)
end

local function setDefaultColor()
	love.graphics.setColor(1, 1, 1)
end

local function setSelectionColor()
	love.graphics.setColor(1, 1, 1)
end

local function setHighlightColor()
	love.graphics.setColor(0.16, 0.32, 0.75)
end

local function setDefaults()
	setDefaultColor()
	love.graphics.setLineWidth(1)
end

function love.draw()
	local cellWidth = VW/3
	local cellHeight = VH/3
	for x=0,2 do
		for y=0,2 do
			setDefaults()
			local gridValue = grid[x+1][y+1]
			love.graphics.rectangle('line', x*cellWidth, y*cellHeight, cellWidth, cellHeight)
			if gridValue == 1 then
				love.graphics.setLineWidth(2)
				love.graphics.circle('line', (x+cellWidth)/2, (y+cellHeight)/2, cellWidth*0.25)
				setDefaults()
			end
			if x == selected.x and y == selected.y then
				setSelectionColor()
				local offset = 5
				love.graphics.rectangle('line', x*cellWidth+offset, y*cellHeight+offset, cellWidth-(offset*2), cellHeight-(offset*2))
			end
		end
	end
end
