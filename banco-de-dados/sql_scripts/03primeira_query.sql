USE demonstracoes_contabeis;

WITH todas_tabelas AS (
    SELECT * FROM 1T2024
    UNION ALL
    SELECT * FROM 2T2024
    UNION ALL
    SELECT * FROM 3T2024
    UNION ALL
    SELECT * FROM 4T2024
),
ultimo_trimestre AS (
    SELECT 
        MAX(YEAR(data)) AS ano,
        MAX(QUARTER(data)) AS trimestre
    FROM todas_tabelas
)
SELECT 
    o.Razao_Social,
    o.Registro_ANS,
    SUM(f.vl_saldo_final) AS total_despesas
FROM todas_tabelas f
JOIN operadoras o ON f.reg_ans = o.Registro_ANS
JOIN ultimo_trimestre ut 
    ON YEAR(f.data) = ut.ano 
    AND QUARTER(f.data) = ut.trimestre
WHERE 
    f.descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
GROUP BY 
    o.Razao_Social, o.Registro_ANS
ORDER BY 
    total_despesas DESC
LIMIT 10;