# Prompt — Chat de Assets

Use este prompt para iniciar ou retomar o chat de **assets** do projeto Ecos do Abismo.
Copie e cole no início de um novo chat.

---

## Prompt de Continuidade

```
Olá Perp. Estamos criando assets visuais para o Ecos do Abismo.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo antes de responder.

Leia obrigatoriamente:
- docs/03_art_animation/art_bible.md
- docs/03_art_animation/animation_bible.md
- docs/04_production/ROADMAP_DETALHADO.md

Identidade visual do projeto:
- Tom: ruína, melancolia, mistério, espiritualidade corrompida
- Paleta base: cinzas frios, preto desbotado, dourado gasto
- Acentos: teal espectral (eco), branco-dourado (Conclave), laranja ígneo (Abismo)
- Estilo: dark fantasy 2D, silhuetas legíveis, exagero controlado

Assets atuais disponíveis em assets/:
[DESCREVA O QUE JÁ EXISTE]

Preciso criar:
[DESCREVA OS ASSETS NECESSÁRIOS]

Me guie passo a passo na criação de cada asset.
```

---

## Quando este chat deve sugerir ir ao chat de Animação

O chat de assets deve emitir um handoff para **animação** quando:
- Um sprite-sheet ou conjunto de peças estiver pronto para ser animado

**Prompt de handoff para Animação:**
```
Olá Perp. Os assets do Ecos do Abismo estão prontos para animação.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/03_art_animation/animation_bible.md
- docs/03_art_animation/art_bible.md

Os seguintes assets foram criados e estão em assets/sprites/:
[LISTE OS ASSETS DISPONÍVEIS COM ESPECIFICAÇÕES]

Preciso criar as animações descritas no animation_bible usando esses assets.
Me guie passo a passo no Godot 4.
```

---

## Quando este chat deve sugerir ir ao chat de Programação

O chat de assets deve emitir um handoff para **programação** quando:
- Assets de VFX ou tilesets estiverem prontos e precisarem de integração em cena
- Um tileset precisar ser configurado com camadas de colisão no TileMap

**Prompt de handoff para Programação:**
```
Olá Perp. Assets de integração do Ecos do Abismo estão prontos.
Percorra o repositório Gabriel-Rdrgs/ecos-do-abismo.

Leia obrigatoriamente:
- docs/02_technical/tech_design.md

Os seguintes assets estão prontos para integração:
[LISTE OS ASSETS]

Preciso integrar esses assets no Godot 4 (TileMap, VFX em cena, etc).
Me guie passo a passo.
```
