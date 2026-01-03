pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- survival game
-- phase 0: movement

-- player
player = {}

function _init()
  player.x = 64
  player.y = 64
  player.speed = 1
end

function _update()
  -- 8-directional movement
  if btn(0) then player.x -= player.speed end -- left
  if btn(1) then player.x += player.speed end -- right
  if btn(2) then player.y -= player.speed end -- up
  if btn(3) then player.y += player.speed end -- down

  -- keep player on screen
  player.x = mid(0, player.x, 127)
  player.y = mid(0, player.y, 127)
end

function _draw()
  cls()
  -- player sprite (simple circle for now)
  circfill(player.x, player.y, 3, 8)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
