# 📈 Análise de Tendências de Busca — Google Trends (SQL)

## 🎯 Objetivo do Projeto
Esta análise explora os dados públicos do **Google Trends** no **Google Cloud BigQuery** para identificar os termos de pesquisa mais populares nos Estados Unidos na data mais recente registada.

---

## 🛠️ Ferramentas Utilizadas
* **Plataforma Cloud:** Google Cloud Platform (GCP)
* **Data Warehouse:** Google Cloud BigQuery
* **Linguagem:** SQL (Standard SQL)

---

## 🔍 Consulta SQL
A consulta extrai os 10 termos mais pesquisados ordenados pela sua posição (`rank`), considerando a data de atualização mais recente disponível na tabela `top_terms`.

```sql
SELECT 
    term,
    rank,
    score,
    refresh_date
FROM 
    `bigquery-public-data.google_trends.top_terms`
WHERE 
    refresh_date = (SELECT MAX(refresh_date) FROM `bigquery-public-data.google_trends.top_terms`)
ORDER BY 
    rank ASC
LIMIT 10;
