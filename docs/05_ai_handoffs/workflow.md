# Workflow Oficial — Ecos do Abismo

## Objetivo
Definir a ordem oficial de interação entre os 4 chats do projeto para evitar retrabalho, perda de contexto e decisões conflitantes.

## Chats oficiais
1. Programação
2. Animação
3. Assets
4. Produção

## Papel da Produção
O chat de produção é o coordenador.
Ele:
- lê o estado global;
- consulta roadmap e backlog;
- escolhe a próxima frente;
- dispara handoffs para os demais chats;
- garante alinhamento com os documentos.

## Fluxo padrão de execução

### Fluxo 1 — Nova feature jogável
1. Produção define a prioridade.
2. Programação define a implementação mínima.
3. Animação define como a feature deve comunicar estado e timing.
4. Assets define os recursos visuais necessários.
5. Programação integra tudo.
6. Produção registra avanço em backlog/roadmap/changelog.

### Fluxo 2 — Melhoria visual de feature existente
1. Produção identifica a necessidade.
2. Animação define feedback e legibilidade.
3. Assets produz/especifica recursos.
4. Programação integra.
5. Produção registra.

### Fluxo 3 — Novo bloco de cenário ou bioma
1. Produção define escopo.
2. Assets define linguagem visual e recursos mínimos.
3. Programação monta bloco jogável.
4. Animação entra se houver elementos vivos, traps, chefes ou interações específicas.
5. Produção registra e replaneja.

## Regras operacionais
- Nenhum chat deve redefinir sozinho a visão macro do projeto.
- Toda decisão com impacto em outra área deve gerar handoff.
- Toda entrega relevante deve atualizar backlog.
- Mudanças estruturais devem refletir também no documento correspondente.
- O projeto deve sempre priorizar o menor incremento jogável possível.

## Ordem de prioridade padrão
Quando houver dúvida, seguir:
1. Jogabilidade testável
2. Legibilidade
3. Feedback
4. Beleza
5. Sofisticação

## Critério para voltar à implementação
A implementação deve ser retomada quando:
- os documentos centrais existirem;
- o workflow estiver definido;
- os handoffs estiverem padronizados;
- o próximo passo técnico estiver pequeno e claro.

## Próxima fase recomendada
Retomar implementação com foco em:
- consolidar o estado atual do player;
- revisar cena, scripts e nós;
- preparar o primeiro ciclo real de Programação → Animação → Assets → Integração.