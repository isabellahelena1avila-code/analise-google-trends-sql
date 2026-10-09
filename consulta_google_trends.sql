-- Projeto: Análise dos Termos Mais Buscados no Google Trends
-- Fonte de dados: bigquery-public-data.google_trends.top_terms

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
