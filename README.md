# lua-snake-game
# 🐍 Snake Game in Lua (LÖVE2D)

This is a simple and fun Snake game built using [Lua](https://www.lua.org/) and the [LÖVE2D game engine](https://love2d.org/).  
It was created as part of a Lua Game Programming assignment.

---

## 🎮 Features

- Snake movement with arrow keys
- Random food spawning (apple 🍎 with green stem)
- Score and High Score tracking (auto-saves to file)
- Menu screen and Game Over screen
- "Play Again" feature (press `R` to restart)
- Esc to quit the game
- Modular Lua code with proper file structure
- Command Pattern for input handling
- Bonus: Event system using Observer Pattern
- Bonus: Entity-Component System
- Bonus: Vector2 class with custom metamethods

---

## ▶️ How to Play

1. Download and install [LÖVE2D](https://love2d.org/)
2. Clone or download this repo
3. Drag the `snake_game/` folder onto `love.exe` **OR** zip it into `snake_game.love` and drag it onto LÖVE

## 🎮 Play Now

Download the game file:
👉 [snake_game.love](snake_game.love)

Drag it onto [LÖVE2D](https://love2d.org/) to play.

### Controls

| Key | Action               |
|-----|----------------------|
| ↑ ↓ ← → | Move snake         |
| Space / Enter | Start game        |
| R   | Restart after Game Over |
| Esc | Quit game            |

---

## 💾 Save System

- High score is stored in a file called `highscore.txt`
- Automatically saves new high scores when reached

---

## 🧠 Modern Lua Features Used

- Custom metamethods (`__add`, `__eq`, `__tostring`) in `vector2.lua`
- Command pattern in `input.lua`
- Observer pattern in `events.lua`
- Modular component-based structure (`entity.lua`)
- Manual file I/O (compatible with Lua 5.1 used in LÖVE)

---

## 📁 Project Structure
snake_game/
├── main.lua
├── gamestate.lua
├── entity.lua
├── input.lua
├── vector2.lua
├── highscore.lua
├── events.lua
├── snake_game.lua
├── highscore.txt 
└── states/
    ├── menu_state.lua
    └── game_state.lua

