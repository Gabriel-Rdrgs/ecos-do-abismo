# Ecos do Abismo

> Metroidvânia 2D com elementos Souls (Soulsvania), desenvolvido em Godot 4 com GDScript.

Ecos do Abismo é um jogo de ação e exploração em 2D ambientado em um mundo em ruínas, onde o jogador assume o papel de um **Eco-Vagante**, um fragmento de alma que desperta nas profundezas do Abismo. O projeto combina exploração interconectada, combate com stamina e eco, progressão por habilidades, builds variadas e narrativa filosófica baseada em memórias, facções e múltiplos finais.

## Status do projeto

**Fase atual:** protótipo técnico inicial

Implementado até o momento:
- Movimento básico do player
- Pulo
- HUD inicial
- Ataque melee
- Dash horizontal
- Magia simples
- Cena de teste
- Dummy/inimigo de teste com recebimento de dano

Em estruturação:
- documentação do projeto;
- pipeline entre programação, animação e assets;
- roadmap de produção;
- organização por chats/agentes especializados.

## Visão do jogo

### Fantasia principal
Você é um Eco-Vagante, um fragmento de alma que acorda nas profundezas de um mundo destruído. Ao absorver Ecos — memórias e vidas fragmentadas — você reconstrói sua forma, compreende civilizações passadas e decide o destino final do mundo.

### Pilares de design
- Exploração metroidvânia com mapa interconectado e gating por habilidades.
- Combate Souls-like com gestão de vida, stamina e eco.
- Builds significativas com atributos STR, DEX, INT e FTH.
- Narrativa ambígua, facções rivais e múltiplos finais.

## Stack

- **Engine:** Godot 4
- **Linguagem:** GDScript
- **Tipo de projeto:** jogo 2D
- **Estrutura:** cenas, scripts, HUD, protótipos de combate e documentação em evolução

## Como rodar

### Requisitos
- Godot 4 instalado
- Repositório clonado localmente

### Passos
1. Abra o Godot.
2. Selecione **Import**.
3. Escolha a pasta do projeto.
4. Abra o arquivo `project.godot`.
5. Rode a cena principal configurada no projeto ou uma cena de teste, como `test_level.tscn`, se estiver definida no fluxo atual.

## Estrutura do repositório

```text
Ecos-do-Abismo/
├── assets/
├── autoloads/
├── docs/
├── scenes/
├── scripts/
├── .gitignore
├── CHANGELOG.md
├── README.md
└── project.godot
```

### Estrutura de documentação
- `docs/00_overview/` → visão geral e contexto permanente
- `docs/01_game_design/` → GDD e design macro
- `docs/02_technical/` → arquitetura técnica
- `docs/03_art_animation/` → direção visual, assets e animação
- `docs/04_production/` → roadmap e produção
- `docs/05_ai_handoffs/` → protocolos de handoff entre chats/agentes

## Roadmap resumido

### Fase 0 — Estruturação
- Repositório remoto
- README, CHANGELOG e `.gitignore`
- Migração do planejamento para docs
- Criação de documentos operacionais
- Definição dos chats/agentes

### Fase 1 — Protótipo jogável base
- Player completo para protótipo
- HUD inicial
- Magia básica
- Inimigo básico
- Testes de parâmetros

### Fase 2 — Player Feel Pass 1
- Animações básicas
- Feedback visual de hit
- Feedback de dash e cast
- Melhorias de sensação do combate

### Fase 3 — Primeiro slice jogável
- Ruínas Cinzentas
- Fluxo tutorial
- Primeiro chefe placeholder
- Primeiro gate de progressão

## Organização por chats/agentes

O projeto está sendo organizado em 4 frentes principais:

- **Programação:** gameplay, sistemas, Godot 4 e GDScript
- **Animação:** estados, timing, feedback e legibilidade
- **Assets:** sprites, texturas, efeitos visuais e direção de arte
- **Produção:** roadmap, backlog, dependências e documentação

Cada frente deve se alinhar pelos documentos em `docs/` e por protocolos de handoff padronizados.

## Documentação principal

Quando a estrutura de docs estiver concluída, estes serão os documentos de referência:
- `docs/00_overview/context_resume.md`
- `docs/01_game_design/gdd.md`
- `docs/04_production/roadmap.md`
- `docs/05_ai_handoffs/chat_protocol.md`

## Changelog

As mudanças relevantes do projeto devem ser registradas em [`CHANGELOG.md`](./CHANGELOG.md).

## Observações

Este projeto está em fase inicial de prototipagem e estruturação. O foco atual não é acabamento final, mas construir uma base técnica e de produção sólida para evolução contínua.