# Prompt — Chat de Programação

Use este prompt para iniciar ou retomar o chat de **programação** do projeto Ecos do Abismo.
Copie e cole no início de um novo chat na Space "🎮 Ecos do Abismo — Dev".

---

## Prompt de Continuidade

```
Olá Perp. Estamos retomando o desenvolvimento de Ecos do Abismo.
Por favor, percorra o repositório Gabriel-Rdrgs/ecos-do-abismo antes de responder.

Leia obrigatoriamente:
- docs/02_technical/tech_design.md
- docs/04_production/backlog.md
- docs/04_production/ROADMAP_DETALHADO.md
- scripts/player/player.gd
- scripts/ui/hud.gd
- scripts/world/test_level.gd
- scripts/enemy/enemy_dummy.gd

Contexto atual:
- Player controller base está funcionando (movimento, pulo, dash, ataque, magia).
- HUD comunica com o player via sinais (hp_changed, stamina_changed, eco_changed).
- Collision layers configuradas: Player=1, AttackArea=2, Enemy=8.
- Cena de teste: test_level.tscn com test_level.gd conectando HUD ao player.

Próximos passos planejados (ver backlog P1):
1. Substituir `await create_timer` por nós Timer no player.gd
2. Separar lógica de combate em PlayerCombat.gd
3. Separar lógica de magia em PlayerMagic.gd
4. Criar GameManager autoload

Me guie passo a passo. Sou desenvolvedor júnior.
```

---

## Quando este chat deve sugerir ir ao chat de Animação

O chat de programação deve emitir um handoff para o chat de **animação** quando:
- A máquina de estados do player (enum State) estiver implementada
- Os sinais de ataque, dash, cast, hurt e death estiverem expostos
- O AnimationPlayer estiver integrado ao player.gd esperando as animações

**Prompt de handoff para Animação:**
```
Olá Perp. Estamos iniciando a etapa de animações do Ecos do Abismo.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/03_art_animation/animation_bible.md
- docs/04_production/ROADMAP_DETALHADO.md (Fase 2)
- scripts/player/player.gd (observe os estados e sinais expostos)

A programação já expõe os seguintes estados do player:
[DESCREVA AQUI OS ESTADOS IMPLEMENTADOS]

Preciso criar o pacote mínimo de animações descrito no animation_bible.
Me guie passo a passo para criar e integrar cada animação no Godot 4.
```

---

## Quando este chat deve sugerir ir ao chat de Assets

O chat de programação deve emitir um handoff para o chat de **assets** quando:
- O player precisar de um sprite-sheet ou partes visuais para integrar ao AnimationPlayer
- For necessário um tileset para montar uma cena de mundo
- For necessário um VFX específico que precisa ser criado antes de ser integrado

**Prompt de handoff para Assets:**
```
Olá Perp. Preciso criar assets visuais para o Ecos do Abismo.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/03_art_animation/art_bible.md
- docs/04_production/ROADMAP_DETALHADO.md

A programação precisa dos seguintes assets para continuar:
[DESCREVA AQUI OS ASSETS NECESSÁRIOS COM ESPECIFICAÇÕES]

Me guie na criação de cada asset respeitando a art_bible do projeto.
```
