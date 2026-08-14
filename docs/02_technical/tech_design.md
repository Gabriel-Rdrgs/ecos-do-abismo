# Tech Design — Ecos do Abismo

## Objetivo
Definir a organização técnica do projeto em Godot 4, incluindo estrutura de pastas, responsabilidades por sistema, convenções e prioridades de implementação.

---

## Stack
- Engine: Godot 4
- Linguagem: GDScript
- Tipo de jogo: 2D Metroidvânia com elementos Souls

---

## Estrutura de pastas atual
```
res://
├── scenes/
│   ├── player/
│   ├── enemy/
│   ├── ui/
│   ├── world/
│   └── projectiles/
├── scripts/
│   ├── player/
│   ├── enemy/
│   ├── ui/
│   └── world/
├── assets/
└── docs/
```

## Estrutura de pastas desejada
```
res://
├── scenes/
│   ├── player/
│   ├── enemies/
│   ├── ui/
│   ├── world/
│   ├── combat/
│   ├── projectiles/
│   └── test/
├── scripts/
│   ├── player/
│   ├── enemies/
│   ├── ui/
│   ├── combat/
│   ├── systems/
│   └── world/
├── autoloads/
├── assets/
│   ├── sprites/
│   ├── textures/
│   ├── vfx/
│   └── ui/
└── docs/
```

---

## Sistemas e arquivos principais

### Player
- `scenes/player/player.tscn` — cena principal do player
- `scripts/player/player.gd` — controller principal (movimento, input, integração)
- `scripts/player/player_stats.gd` — atributos e fórmulas
- `scripts/player/player_combat.gd` — (a criar) lógica de ataque e dano
- `scripts/player/player_magic.gd` — (a criar) lógica de magia

### UI
- `scenes/ui/hud.tscn`
- `scripts/ui/hud.gd` — recebe sinais do player, atualiza display

### Inimigos
- `scenes/enemy/EnemyDummy.tscn` — dummy de teste
- `scripts/enemy/enemy_dummy.gd`
- (futuro) `EnemyBase.tscn` + `EnemyBase.gd` para herança

### Sistemas (autoloads futuros)
- `GameManager.gd`
- `SaveManager.gd`
- `SceneFlow.gd`

### Combate
- `scripts/systems/combat_calculator.gd` — classe estática (`RefCounted` + `class_name CombatCalculator`), **não é autoload**. Centraliza `calculate_physical_damage(stats)` e `calculate_spell_damage(stats, base_damage, int_scaling, fth_scaling)`. Usada por `player_combat.gd` (dano físico) e `eco_projectile.gd` (dano do Dardo de Eco, `base_damage = 35` conforme `gdd.md` 6.3).

### Cena de teste
- `scenes/world/test_level.tscn`
- `scripts/world/test_level.gd` — conecta HUD ao player via `hud.connect_to_player(player)`

---

## Collision Layers (configuração atual)

| Layer nº | Valor | Uso |
|---|---|---|
| Layer 1 | 1 | Player (CharacterBody2D) |
| Layer 2 | 2 | AttackArea do player |
| Layer 3 | 4 | (reservado) HurtBox do player |
| Layer 4 | 8 | Inimigos |

**Regras:**
- `Player` → Layer 1, Mask 1
- `AttackArea` → Layer 2, Mask 8
- `EnemyDummy` → Layer 8, Mask 2
- Futuros ataques inimigos → Layer própria, Mask 4 (HurtBox do player)

---

## Sistema de sinais (HUD)

O player emite 3 sinais que a HUD escuta:
- `hp_changed(current: int, maximum: int)`
- `stamina_changed(current: float, maximum: float)`
- `eco_changed(current: int, maximum: int)`

Conexão feita em `test_level.gd` via `hud.connect_to_player(player)`.

---

## Fórmulas de atributos
- HP = 100 + VIG * 20
- STA_MAX = 50 + STA * 10
- ECO_MAX = 30 + (INT + FTH) * 8

---

## Convenções
- Uma cena principal por entidade jogável/importante.
- Scripts com nomes iguais às cenas quando forem scripts principais.
- Lógica de cálculo separada de lógica visual quando possível.
- Evitar scripts monolíticos.
- Refatorar somente quando houver ganho real de clareza.
- Toda mudança estrutural importante deve ser registrada neste documento.

---

## Status técnico atual (13/05/2026)

### Concluído
- Player controller base (movimento, pulo, dash, ataque, magia)
- HUD via sinais (sem polling)
- Collision layers configuradas corretamente
- Cena de teste funcional
- PlayerCombat e PlayerMagic separados do player.gd
- GameManager autoload criado
- `await create_timer` substituído por nós Timer no player
- CombatCalculator centralizando dano físico e mágico (usado por PlayerCombat e EcoProjectile)

### Próximo foco
- Preparar integração com AnimationPlayer
