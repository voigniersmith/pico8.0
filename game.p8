pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- survival game
-- phase 1: single enemy + combat

-- player
player = {}

-- enemy
enemy = {}

-- projectiles
projectiles = {}

function spawn_enemy()
  -- spawn at random edge
  local side = flr(rnd(4))
  if side == 0 then
    -- top
    enemy.x = rnd(128)
    enemy.y = 0
  elseif side == 1 then
    -- right
    enemy.x = 127
    enemy.y = rnd(128)
  elseif side == 2 then
    -- bottom
    enemy.x = rnd(128)
    enemy.y = 127
  else
    -- left
    enemy.x = 0
    enemy.y = rnd(128)
  end
  enemy.speed = 0.5
  enemy.alive = true
end

function _init()
  player.x = 64
  player.y = 64
  player.speed = 1
  player.hp = 10
  player.maxhp = 10

  projectiles = {}
  spawn_enemy()
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

  -- enemy AI: move toward player
  local dx = player.x - enemy.x
  local dy = player.y - enemy.y
  local dist = sqrt(dx*dx + dy*dy)

  if dist > 0 then
    enemy.x += (dx/dist) * enemy.speed
    enemy.y += (dy/dist) * enemy.speed
  end

  -- collision: enemy damages player
  if dist < 6 then
    player.hp -= 1
    if player.hp <= 0 then
      -- game over (for now just reset)
      _init()
    end
  end

  -- shoot projectile with X button
  if btnp(4) then
    -- shoot toward enemy
    local dx = enemy.x - player.x
    local dy = enemy.y - player.y
    local dist = sqrt(dx*dx + dy*dy)

    if dist > 0 then
      add(projectiles, {
        x = player.x,
        y = player.y,
        vx = (dx/dist) * 2,
        vy = (dy/dist) * 2
      })
    end
  end

  -- update projectiles
  for p in all(projectiles) do
    p.x += p.vx
    p.y += p.vy

    -- check collision with enemy
    if enemy.alive then
      local dx = p.x - enemy.x
      local dy = p.y - enemy.y
      local dist = sqrt(dx*dx + dy*dy)

      if dist < 4 then
        enemy.alive = false
        del(projectiles, p)
        -- respawn enemy
        spawn_enemy()
      end
    end

    -- remove if off screen
    if p.x < 0 or p.x > 127 or p.y < 0 or p.y > 127 then
      del(projectiles, p)
    end
  end
end

function _draw()
  cls()

  -- enemy
  if enemy.alive then
    circfill(enemy.x, enemy.y, 3, 14)
  end

  -- projectiles
  for p in all(projectiles) do
    circfill(p.x, p.y, 1, 10)
  end

  -- player sprite (simple circle for now)
  circfill(player.x, player.y, 3, 8)

  -- UI: health
  print("hp: "..player.hp.."/"..player.maxhp, 2, 2, 7)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
