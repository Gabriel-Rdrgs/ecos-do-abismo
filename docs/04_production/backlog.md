# Backlog — Ecos do Abismo

## Critério
Itens organizados por prioridade e área. Cada item deve ser pequeno o suficiente para ser concluído, testado e registrado.

---

## P0 — Estruturação
- [x] Criar repositório remoto
- [x] Criar README
- [x] Criar CHANGELOG
- [x] Criar estrutura inicial de docs
- [x] Migrar planejamento para GDD
- [x] Criar context_resume.md
- [x] Criar roadmap.md
- [x] Criar chat_protocol.md
- [x] Criar tech_design.md
- [x] Criar art_bible.md
- [x] Criar animation_bible.md
- [x] Criar workflow.md
- [x] Criar prompts.md
- [x] Criar ROADMAP_DETALHADO.md
- [x] Criar prompts de handoff para cada chat especializado

---

## P1 — Protótipo técnico
- [x] Revisar estrutura atual de cenas e scripts
- [x] Consolidar Player.tscn
- [x] Migrar HUD de polling para sinais
- [x] Corrigir collision layers/masks (bug HP player)
- [x] Organizar cena de teste (test_level.tscn + test_level.gd)
- [ ] Substituir `await create_timer` por nós Timer no player
- [ ] Separar lógica de combate em PlayerCombat.gd
- [ ] Separar lógica de magia em PlayerMagic.gd
- [ ] Revisar magia simples (eco_projectile)
- [ ] Consolidar dummy/inimigo básico com HurtBox separado
- [ ] Criar GameManager autoload
- [ ] Criar CombatCalculator

---

## P1 — Player Feel Pass 1
- [ ] Definir assets mínimos para animação (ver animation_bible.md)
- [ ] Criar visual provisório do personagem com AnimationPlayer
- [ ] Criar textura provisória de chão coerente com art_bible
- [ ] Integrar AnimationPlayer ao player.gd via estado de máquina simples
- [ ] Integrar feedback simples de ataque (flash + som placeholder)
- [ ] Integrar feedback simples de dash (trail + som placeholder)
- [ ] Integrar feedback simples de cast (VFX eco)

---

## P2 — Slice inicial (Ruínas Cinzentas)
- [ ] Planejar layout inicial das Ruínas Cinzentas
- [ ] Definir tiles provisórios coerentes com art_bible
- [ ] Criar primeiro fluxo tutorial
- [ ] Posicionar primeiro inimigo funcional com IA simples (patrulha + ataque)
- [ ] Criar primeiro encontro guiado
- [ ] Definir primeiro chefe placeholder (Guardião das Sombras)

---

## Regras do backlog
- Não jogar ideias soltas aqui sem prioridade.
- Todo item deve ser acionável.
- Itens grandes devem ser quebrados antes de entrar em execução.
- Ao concluir algo relevante, atualizar também roadmap e changelog quando necessário.
