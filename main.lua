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
	if n < min then
		return min
	elseif n > max then
		return max
	else
		return n
	end
end

function love.keypressed(key)
	if key == 'h' then
		selected.y = clamp(selected.y - 1)
	elseif key == 'j' then
		selected.x = clamp(selected.x + 1)
	elseif key == 'k' then
		selected.x = clamp(selected.x - 1)
	elseif key == 'l' then
		selected.y = clamp(selected.y + 1)
	end
end

function love.update(dt)
end

function love.draw()
	local cellWidth = VW/3
	local cellHeight = VH/3
	for x=0,2 do
		for y=0,2 do
			if x == selected.x and y == selected.y then
				love.graphics.rectangle('fill', y*cellWidth, x*cellHeight, cellWidth, cellHeight)
			else 
				love.graphics.rectangle('line', y*cellWidth, x*cellHeight, cellWidth, cellHeight)
			end
		end
	end
end
