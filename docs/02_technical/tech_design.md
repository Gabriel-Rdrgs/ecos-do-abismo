# Tech Design — Ecos do Abismo

## Objetivo
Definir a organização técnica inicial do projeto em Godot 4, incluindo estrutura de pastas, responsabilidades por sistema, convenções e prioridades de implementação.

## Stack
- Engine: Godot 4
- Linguagem: GDScript
- Tipo de jogo: 2D Metroidvânia com elementos Souls

## Estrutura atual do projeto
Estado real do repositório em 2026-05-12.

```text
res://
├── scenes/
│   ├── player/
│   ├── enemy/
│   ├── projectiles/
│   ├── ui/
│   └── world/
├── scripts/
│   ├── player/
│   │   ├── player.gd
│   │   └── player_stats.gd
│   ├── enemy/
│   │   └── enemy_dummy.gd
│   ├── projectiles/
│   │   └── eco_projectile.gd
│   ├── ui/
│   │   └── hud.gd
│   └── teste.gd (órfão — remover)
├── assets/
└── docs/
```

## Organização técnica desejada
Meta de estrutura para quando o projeto crescer além do protótipo.

```text
res://
├── scenes/
│   ├── player/
│   ├── enemies/
│   ├── projectiles/
│   ├── ui/
│   ├── world/
│   ├── combat/
│   └── test/
├── scripts/
│   ├── player/
│   ├── enemies/
│   ├── projectiles/
│   ├── ui/
│   ├── combat/
│   └── systems/
├── autoloads/
├── assets/
│   ├── sprites/
│   ├── textures/
│   ├── vfx/
│   └── ui/
└── docs/
```

## Sistemas prioritários
A fase inicial do projeto foca nos sistemas necessários para o protótipo técnico jogável:

1. Player controller
2. HUD de HP / Stamina / Eco
3. Ataque melee
4. Dash com custo de stamina
5. Magia simples (projétil de eco)
6. Inimigo básico (dummy)
7. Testes de parâmetros

## Cena do Player
A cena `Player` sustenta o protótipo central do jogo.

### Responsabilidades
- movimento horizontal;
- pulo;
- gravidade;
- dash;
- ataque melee;
- cast de magia;
- leitura de atributos via `PlayerStats`;
- integração futura com animação;
- recebimento de dano;
- emissão de sinais para HUD e sistemas de feedback.

## Componentes técnicos existentes
Scripts e cenas que já existem no repositório.

### Player
- `player.gd` — controlador principal (movimento, combate, magia, dash)
- `player_stats.gd` — Resource com atributos e fórmulas de HP/STA/ECO

### Inimigos
- `enemy_dummy.gd` — dummy estático para testes de dano

### Projectiles
- `eco_projectile.gd` — projétil simples da magia base

### UI
- `hud.gd` — exibe HP, Stamina e Eco em polling por frame

## Componentes técnicos futuros
Arquitetura desejada para quando o player.gd precisar ser refatorado.
Não implementar antes de o protótipo estar estável.

### Player (futura separação)
- `PlayerCombat.gd` — lógica de ataque, hitbox e cooldowns
- `PlayerMagic.gd` — lógica de cast, custo de eco e instanciação de projéteis

### Sistemas
- `GameManager.gd` — controle de estado global (futuro)
- `CombatCalculator.gd` — cálculos de dano separados do controller (futuro)
- `SaveManager.gd` — persistência (futuro)
- `SceneFlow.gd` — transições entre cenas (futuro)

## Pontos de atenção técnica (diagnosticados em 2026-05-12)
- `hud.gd` usa polling em `_process` — ideal migrar para sinais quando o player estiver estável.
- `try_attack()` e `try_dash()` usam `await create_timer` — sujeito a erro se o nó for destruído. Migrar para `Timer` como nó filho no futuro.
- `eco_projectile.gd` move via `position.x +=` sem física — funcional para protótipo, mas precisa de revisão para o jogo final.
- Stamina regenera apenas no chão — comportamento a confirmar intencionalmente no GDD.
- `scripts/teste.gd` está órfão na raiz de scripts — remover.

## Convenções
- Uma cena principal por entidade jogável/importante.
- Scripts com nomes iguais às cenas quando forem scripts principais.
- Lógica de cálculo separada de lógica visual quando possível.
- Evitar scripts monolíticos muito cedo.
- Refatorar somente quando houver ganho real de clareza.

## Dados de protótipo
As fórmulas-base atuais são:
- HP = 100 + VIG * 20
- STA_MAX = 50 + STA * 10
- ECO_MAX = 30 + (INT + FTH) * 8

Esses valores são provisórios e devem ser validados em playtest.

## Prioridade técnica atual

### Concluído
- Base jogável do player com movimento, pulo, dash, ataque e magia
- HUD inicial (HP, Stamina, Eco)
- Dummy/inimigo de teste recebendo dano
- Projétil básico de eco funcional

### Próximo foco
- Remover `scripts/teste.gd` órfão
- Migrar HUD de polling para sinais
- Substituir `await create_timer` por `Timer` nó no player
- Confirmar comportamento de stamina no ar no GDD
- Preparar integração com sistema de animação

## Regras de evolução
- Implementar primeiro o que destrava playtest.
- Não introduzir sistemas complexos cedo demais.
- Cada nova feature deve ser testável isoladamente.
- Toda mudança estrutural importante deve ser registrada neste documento.
