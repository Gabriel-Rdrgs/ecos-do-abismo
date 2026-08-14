# Roadmap Detalhado — Ecos do Abismo

Este documento descreve cada fase do projeto, destrinchando as responsabilidades por disciplina: **programação**, **animação** e **assets**.
Cada fase só começa quando a anterior estiver estável o suficiente para não bloquear.

---

## Fase 0 — Fundação ✅
**Objetivo:** repositório, documentação e estrutura prontos.

| Disciplina | Tarefa | Status |
|---|---|---|
| Produção | Criar repositório e estrutura de docs | ✅ |
| Produção | GDD, backlog, roadmap, bibles | ✅ |
| Produção | Prompts de handoff entre chats | ✅ |

---

## Fase 1 — Protótipo Técnico (Player Base) 🔄
**Objetivo:** player jogável, HUD funcional, inimigo de teste respondendo a dano.

| Disciplina | Tarefa | Status |
|---|---|---|
| Programação | Player controller (movimento, pulo, dash) | ✅ |
| Programação | HUD com sinais hp/stamina/eco | ✅ |
| Programação | Ataque melee com hitbox | ✅ |
| Programação | Magia simples (eco projectile) | ✅ |
| Programação | Inimigo dummy recebendo dano | ✅ |
| Programação | Collision layers/masks corretas | ✅ |
| Programação | Substituir `await create_timer` por Timer nodes | ✅ |
| Programação | Separar PlayerCombat.gd | ✅ |
| Programação | Separar PlayerMagic.gd | ✅ |
| Programação | GameManager autoload | ✅ |
| Assets | Sprite provisório do player (legível) | ⬜ |
| Assets | Textura provisória de chão | ⬜ |

**Handoff → Animação:** quando `PlayerCombat.gd` separado e estados expostos via sinais/enum.

---

## Fase 2 — Player Feel Pass 1 ⬜
**Objetivo:** animações mínimas integradas, feedback visual de ações.

| Disciplina | Tarefa | Status |
|---|---|---|
| Assets | Corpo base do player (sprite-sheet ou peças) | ⬜ |
| Assets | Arma (espada longa) sprite | ⬜ |
| Assets | VFX slash simples | ⬜ |
| Assets | VFX dash simples | ⬜ |
| Assets | VFX eco/cast simples | ⬜ |
| Animação | Idle | ⬜ |
| Animação | Run | ⬜ |
| Animação | Jump Start + Fall | ⬜ |
| Animação | Attack Light (sincronizado com hitbox) | ⬜ |
| Animação | Dash | ⬜ |
| Animação | Cast | ⬜ |
| Animação | Hurt + Death | ⬜ |
| Programação | Máquina de estados do player (enum State) | ⬜ |
| Programação | Integrar AnimationPlayer ao player.gd | ⬜ |
| Programação | Sincronizar hitbox com frame de ataque | ⬜ |

**Handoff → Assets:** quando animation_bible.md estiver completo e programação confirmar estados disponíveis.
**Handoff → Programação:** quando sprites estiverem prontos para integrar ao AnimationPlayer.

---

## Fase 3 — Inimigo Base + Primeiro Encontro ⬜
**Objetivo:** inimigo funcional com IA simples, primeiro encontro jogável.

| Disciplina | Tarefa | Status |
|---|---|---|
| Programação | EnemyBase.gd com HP, dano, knockback | ⬜ |
| Programação | IA simples: patrulha + detecção + ataque | ⬜ |
| Programação | HurtBox do player (Layer 3) | ⬜ |
| Programação | Sistema de knockback no player | ⬜ |
| Assets | Sprite do inimigo básico (Ruínas Cinzentas) | ⬜ |
| Assets | VFX de hit no inimigo | ⬜ |
| Animação | Idle + Walk + Attack + Death do inimigo | ⬜ |

---

## Fase 4 — Slice das Ruínas Cinzentas ⬜
**Objetivo:** primeiro bioma jogável do início ao chefe.

| Disciplina | Tarefa | Status |
|---|---|---|
| Programação | TileMap com tiles de colisão | ⬜ |
| Programação | Sistema de câmera com limites | ⬜ |
| Programação | Checkpoints / save básico | ⬜ |
| Programação | Chefe: Guardião das Sombras (moveset básico) | ⬜ |
| Assets | Tileset de pedra das Ruínas Cinzentas | ⬜ |
| Assets | Background em parallax | ⬜ |
| Assets | Sprite do Guardião das Sombras | ⬜ |
| Animação | Animações do Guardião das Sombras | ⬜ |

---

## Fase 5 — Sistema de Eco (Morte/Progressão) ⬜
**Objetivo:** sistema de morte, orbe de eco, penalidades e nivelamento.

| Disciplina | Tarefa | Status |
|---|---|---|
| Programação | Orbe de eco ao morrer | ⬜ |
| Programação | Penalidade de -10% HP/dano sem eco | ⬜ |
| Programação | Recuperação do eco (interação) | ⬜ |
| Programação | Sistema de XP e nivelamento | ⬜ |
| Programação | Tela de level-up no Santuário | ⬜ |
| Assets | VFX do orbe de eco | ⬜ |
| Assets | Sprites do Santuário das Almas | ⬜ |

---

## Regras do Roadmap
- Cada fase deve ser estável antes de avançar.
- Itens de uma fase podem ser feitos em paralelo entre disciplinas, desde que as dependências estejam claras.
- Ao completar uma fase, atualizar este arquivo e o CHANGELOG.
- Handoffs entre chats devem usar os prompts em `docs/05_ai_handoffs/`.
