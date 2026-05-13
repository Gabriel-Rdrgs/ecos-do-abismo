# Prompt — Chat de Animação

Use este prompt para iniciar ou retomar o chat de **animação** do projeto Ecos do Abismo.
Copie e cole no início de um novo chat (pode ser na mesma Space ou em outra).

---

## Prompt de Continuidade

```
Olá Perp. Estamos na etapa de animações do Ecos do Abismo.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo antes de responder.

Leia obrigatoriamente:
- docs/03_art_animation/animation_bible.md
- docs/03_art_animation/art_bible.md
- docs/04_production/ROADMAP_DETALHADO.md (Fase 2)
- scripts/player/player.gd (observe os estados do player)

Contexto atual:
- O player tem os seguintes estados/sinais disponíveis para animação:
  [DESCREVA AQUI OS ESTADOS/SINAIS IMPLEMENTADOS PELA PROGRAMAÇÃO]
- Assets disponíveis em assets/sprites/

Pacote de animações necessário (ver animation_bible.md):
- Idle, Run, Jump Start, Jump Fall, Land
- Attack Light (sincronizado com hitbox)
- Dash, Cast, Hurt, Death

Me guie passo a passo na criação e integração de cada animação no Godot 4.
Sou desenvolvedor júnior.
```

---

## Quando este chat deve sugerir ir ao chat de Assets

O chat de animação deve emitir um handoff para **assets** quando:
- Um sprite-sheet ou peças visuais ainda não existem e são necessárias para a animação
- Um VFX precisa ser criado antes de ser animado

**Prompt de handoff para Assets:**
```
Olá Perp. A animação do Ecos do Abismo precisa de novos assets.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/03_art_animation/art_bible.md

Preciso dos seguintes assets para continuar as animações:
[DESCREVA AQUI COM ESPECIFICAÇÕES: tamanho, frames, estilo, referências do art_bible]

Me guie na criação respeitando a art_bible.
```

---

## Quando este chat deve sugerir ir ao chat de Programação

O chat de animação deve emitir um handoff para **programação** quando:
- As animações estiverem prontas e precisarem ser integradas ao AnimationPlayer
- Um estado do player precisar ser exposto via código para disparar uma animação
- O timing da hitbox precisar ser ajustado junto com o frame de ataque

**Prompt de handoff para Programação:**
```
Olá Perp. As animações do Ecos do Abismo estão prontas para integração.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/02_technical/tech_design.md
- scripts/player/player.gd

As seguintes animações estão prontas em assets/sprites/:
[LISTE AS ANIMAÇÕES PRONTAS]

Preciso integrar essas animações ao player.gd e sincronizar a hitbox com o frame de ataque.
Me guie passo a passo.
```
