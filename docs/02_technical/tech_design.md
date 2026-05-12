# Tech Design — Ecos do Abismo

## Objetivo
Definir a organização técnica inicial do projeto em Godot 4, incluindo estrutura de pastas, responsabilidades por sistema, convenções e prioridades de implementação.

## Stack
- Engine: Godot 4
- Linguagem: GDScript
- Tipo de jogo: 2D Metroidvânia com elementos Souls [file:1]

## Estrutura atual do projeto
```text
res://
├── scenes/
│   ├── player/
│   ├── ui/
│   └── world/
├── scripts/
│   ├── player/
│   └── systems/
├── autoloads/
└── assets/
```

## Organização técnica desejada
```text
res://
├── scenes/
│   ├── player/
│   ├── enemies/
│   ├── ui/
│   ├── world/
│   ├── combat/
│   └── test/
├── scripts/
│   ├── player/
│   ├── enemies/
│   ├── ui/
│   ├── combat/
│   └── systems/
├── autoloads/
├── assets/
│   ├── sprites/
│   ├── textures/
│   ├── vfx/
│   └── ui/
```

## Sistemas prioritários
A fase inicial do projeto foca nos sistemas citados como próximos passos de desenvolvimento [file:1]:

1. Player controller
2. HUD de HP / Stamina / Eco
3. Ataque melee
4. Dash / roll com custo de stamina
5. Magia simples
6. Inimigo básico
7. Testes de parâmetros

## Cena do Player
A cena `Player` deve sustentar o protótipo central do jogo [file:1].

### Responsabilidades
- movimento horizontal;
- pulo;
- gravidade;
- dash;
- ataque;
- cast de magia;
- leitura de atributos;
- integração com animação;
- recebimento de dano;
- emissão de eventos para HUD e feedback.

## Componentes técnicos desejados
Mesmo que no começo parte disso ainda esteja simples, a arquitetura deve apontar para separação clara de responsabilidades.

### Player
- `Player.tscn`
- `Player.gd`
- `PlayerStats.gd`
- `PlayerCombat.gd`
- `PlayerMagic.gd`

### Inimigos
- `EnemyBase.tscn`
- `EnemyBase.gd`
- `DummyEnemy.tscn`
- `DummyEnemy.gd`

### UI
- `HUD.tscn`
- `HUD.gd`

### Sistemas
- `GameManager.gd`
- `CombatCalculator.gd`
- `SaveManager.gd` (futuro)
- `SceneFlow.gd` (futuro)

## Convenções
- Uma cena principal por entidade jogável/importante.
- Scripts com nomes iguais às cenas quando forem scripts principais.
- Lógica de cálculo separada de lógica visual quando possível.
- Evitar scripts monolíticos muito cedo.
- Refatorar somente quando houver ganho real de clareza.

## Dados de protótipo
As fórmulas-base atuais são [file:1]:
- HP = 100 + VIG * 20
- STA_MAX = 50 + STA * 10
- ECO_MAX = 30 + (INT + FTH) * 8

Esses valores são provisórios e devem ser validados em playtest [file:1].

## Prioridade técnica atual
### Em andamento
- Base jogável do player
- HUD inicial
- combate inicial
- magia simples
- dummy/inimigo de teste

### Próximo foco
- estabilizar arquitetura do player;
- melhorar separação entre input, movimento, combate e stats;
- preparar integração com animação;
- preparar documentação suficiente para expansão.

## Regras de evolução
- Implementar primeiro o que destrava playtest.
- Não introduzir sistemas complexos cedo demais.
- Cada nova feature deve ser testável isoladamente.
- Toda mudança estrutural importante deve ser registrada neste documento.