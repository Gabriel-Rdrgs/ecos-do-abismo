# Animation Bible — Ecos do Abismo

## Objetivo
Definir as animações mínimas do projeto no estágio atual, com foco em gameplay legível, sensação de controle e integração com programação.

## Princípio central
Animação deve servir:
- legibilidade;
- game feel;
- timing de combate;
- feedback do jogador.

No estágio atual, animação não é acabamento. Ela é parte do sistema.

## Pacote mínimo do Player Feel Pass 1
Com base no protótipo inicial previsto para player, ataque, dash e magia [file:1], o pacote mínimo é:

1. Idle
2. Run
3. Jump Start
4. Jump Fall
5. Land
6. Attack Light
7. Dash
8. Cast
9. Hurt
10. Death

## Prioridade por nível

### Prioridade crítica
- Idle
- Run
- Jump Start
- Jump Fall
- Attack Light
- Dash
- Cast

### Prioridade alta
- Land
- Hurt

### Prioridade média
- Death

## Função de cada animação

### Idle
- comunica estado neutro;
- define personalidade base;
- precisa ter boa leitura mesmo parada.

### Run
- comunica velocidade, peso e controle;
- deve funcionar bem em side-scroller.

### Jump Start
- deixa a saída do chão legível;
- melhora resposta visual do input.

### Jump Fall
- comunica vulnerabilidade aérea;
- diferencia claramente subida e queda.

### Land
- reforça impacto e peso;
- ajuda na percepção do fim do salto.

### Attack Light
- deve ter leitura clara de início, ativo e recuperação;
- precisa sincronizar com hitbox.

### Dash
- comunica deslocamento rápido e evasão;
- deve casar com i-frames e custo de stamina [file:1].

### Cast
- precisa diferenciar magia de ataque físico;
- deve sugerir canalização de eco.

### Hurt
- informa dano recebido;
- não pode comprometer demais o controle quando o design não pedir isso.

### Death
- estado de falha;
- pode ser simples no protótipo.

## Estrutura de timing
No estágio atual, toda animação de ação deve considerar:
- anticipation;
- active;
- recovery.

Especialmente:
- ataque;
- dash;
- cast;
- hurt.

## Dependências com programação
O chat de programação precisa expor:
- estados do player;
- eventos de ataque;
- eventos de dash;
- eventos de cast;
- recebimento de dano;
- morte.

## Dependências com assets
O chat de assets precisa fornecer:
- corpo base do player;
- arma;
- manto/camada secundária;
- VFX simples de slash;
- VFX de dash;
- VFX de eco/cast.

## Regras
- animação deve reforçar gameplay, não brigar com ele;
- legibilidade lateral é obrigatória;
- exagero controlado é melhor do que rigidez sem vida;
- assets provisórios podem usar poucos frames, desde que comuniquem a ação.