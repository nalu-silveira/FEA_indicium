# 🚴 Adventure Works - Modern Data Stack Pipeline

Análise de dados moderna, governança e modelagem dimensional aplicada ao processo de negócio de Vendas da **Adventure Works**, convertendo dados operacionais brutos em uma estrutura de alto desempenho focada em tomadas de decisões executivas.

## 📌 Cenário de Negócio & Objetivos
A Adventure Works necessitava de uma infraestrutura que atuasse como a **Única Fonte da Verdade (Single Source of Truth)** para responder a perguntas complexas de faturamento, ticket médio e comportamento de clientes. O projeto foi desenhado para sanar dores de stakeholders-chave:
- **Garantia de Qualidade (CEO Carlos Silveira):** Validação matemática automatizada contra dados da auditoria contábil.
- **Direcionamento de ROI (Diretora Comercial Silvana Teixeira):** Identificação clara das melhores mecânicas de promoção e perfis de clientes qualificados.
- **Desafogamento de Infraestrutura (TI Nilson/Gabriel):** Desacoplamento das consultas analíticas do ERP transacional (SAP) para um ambiente escalável em nuvem.

---

## 🛠️ Stack Tecnológica
- **Camada de Armazenamento & Processamento:** Data Lakehouse com Databricks (Delta Lake).
- **Transformação & Governança de Dados:** dbt (Data Build Tool).
- **Camada de Consumo & BI:** Power BI Desktop (Conexão via DirectQuery/Import para tabelas otimizadas).
- **Versionamento:** Git & GitHub.

---

## 🏛️ Modelagem Dimensional (Star Schema)
A arquitetura foi desenhada seguindo a metodologia de Ralph Kimball, estruturando a camada de negócios (`marts`) em um Esquema Estrela purificado através de chaves substitutas (Surrogate Keys - SK via MD5 hash):

- **`fct_vendas` (Fato Central):** Consolida métricas financeiras (Faturamento Bruto, quantidades, descontos) e chaves de ligação.
- **`dim_clientes`:** Cadastro higienizado e unificado de compradores.
- **`dim_produtos`:** Hierarquia completa de Categorias e Subcategorias com tradução de termos técnicos.
- **`dim_localizacoes`:** Consolidação geográfica (Cidade, Estado, País) desnormalizada para análises de densidade de vendas.
- **`dim_cartoes_credito`:** Agrupamento por bandeiras de pagamento.

---

## 🧪 Governança, Testes e Qualidade do Dado
O projeto implementa uma barreira rigorosa de testes automatizados para mitigar erros em produção:
1. **Testes de Schema/Fontes (`dbt test --select source:*`):** Validação de integridade dos dados brutos na chegada ao Lakehouse.
2. **Testes de Chaves Primárias:** Testes de unicidade (`unique`) e não-nulidade (`not_null`) nas tabelas de dimensões e fatos.
3. **Teste de Auditoria de Dados (Custom Singular Test):** Teste de negócio exclusivo que valida se o total de vendas brutas de 2011 bate rigorosamente com o valor de **$12.646.112,16** exigido pela auditoria contábil da diretoria.

---

## 🚀 Como Executar o Projeto dbt

### 1. Pré-requisitos
Certifique-se de ter o dbt-core instalado ou acesso ao dbt Cloud configurado com as credenciais do seu Databricks Workspace.

### 2. Execução dos Modelos
Para compilar e materializar toda a estrutura de tabelas de Staging e Marts no Lakehouse, execute:
```bash
dbt run