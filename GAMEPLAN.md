# PICO-8 Survival Game - Development Plan

**Genre:** Resource Gathering, Survival, Rogue-Lite, Overwhelming Monster Survival
**Inspiration:** Vampire Survivors, 20 Minutes Till Dawn

---

## Core Pillars
- **Overwhelming Numbers:** Screen filled with enemies
- **Auto-Combat:** Weapons fire automatically
- **Power Progression:** Get stronger through XP and upgrades
- **Survival Focus:** Last as long as possible
- **Rogue-Lite:** Runs are ~10-15 minutes, meta-progression between runs

---

## Development Phases

### Phase 0: Project Setup & Basic Movement
**Goal:** Playable character that moves around

**Why:** Foundation for everything else. Need to verify controls feel good.

**Deliverables:**
- PICO-8 cart structure (init/update/draw)
- Player sprite
- 8-directional movement

---

### Phase 1: Single Enemy + Basic Combat
**Goal:** One enemy that chases and damages player

**Why:** Core gameplay loop - avoid danger, fight back

**Deliverables:**
- Enemy sprite and AI (move toward player)
- Player health system
- Basic attack mechanism (projectile or melee)
- Enemy takes damage and dies

---

### Phase 2: Enemy Spawning & Waves
**Goal:** Enemies spawn continuously, increasing difficulty

**Why:** Creates the "overwhelming" feeling

**Deliverables:**
- Spawn enemies at screen edges
- Spawn rate increases over time
- Enemy cap (PICO-8 token/memory limits)
- Kill counter

---

### Phase 3: Resources & XP System
**Goal:** Defeated enemies drop XP gems, player collects them

**Why:** Core progression mechanic

**Deliverables:**
- XP gem drops from enemies
- Player collision with gems
- XP bar UI
- Level up trigger

---

### Phase 4: Level-Up & Upgrades
**Goal:** On level up, pause and choose 1 of 3 upgrades

**Why:** Player agency, build variety

**Deliverables:**
- Pause on level up
- Show 3 random upgrade options
- Apply selected upgrade
- Upgrade types: damage, fire rate, speed, max HP, etc.

---

### Phase 5: Multiple Enemy Types
**Goal:** 3-4 different enemy types with varied behavior

**Why:** Variety, tactical decisions

**Deliverables:**
- Fast but weak enemies
- Slow but tanky enemies
- Ranged enemies (optional, complexity)
- Different spawn weights by time

---

### Phase 6: Weapons & Auto-Attack
**Goal:** Weapons fire automatically, multiple weapon types

**Why:** Core "overwhelm" power fantasy

**Deliverables:**
- Auto-fire toward nearest enemy
- 2-3 weapon types (e.g., fireball, lightning, orbit)
- Weapon upgrade system (more weapons = more power)

---

### Phase 7: Survival Timer & Game Over
**Goal:** Track time survived, game over on death, restart option

**Why:** Win condition, replayability hook

**Deliverables:**
- Timer UI (MM:SS)
- Death screen with stats (time, kills, level)
- Restart to menu

---

### Phase 8: Rogue-Lite Elements
**Goal:** Meta-progression between runs

**Why:** Long-term engagement

**Deliverables:**
- Persistent currency (souls/coins)
- Meta-upgrade shop (start with bonus HP, etc.)
- Unlock new weapons/characters

---

### Phase 9: Polish & Juice
**Goal:** Game feel improvements

**Why:** PICO-8 games live or die on feel

**Deliverables:**
- Screen shake on hit
- Particle effects
- Sound effects (SFX)
- Music
- Visual feedback (damage numbers, flashes)

---

## PICO-8 Constraints to Keep in Mind
- **Token Limit:** 8192 tokens (compressed code)
- **Sprite Limit:** 128 sprites (8x8 pixels)
- **Map Size:** 128x64 tiles
- **Memory:** Limited for object pools
- **Performance:** Need efficient collision detection

---

## Next Steps
1. Review and adjust phases
2. Break down Phase 0 into specific tasks
3. Implement Phase 0
4. Repeat for each phase
