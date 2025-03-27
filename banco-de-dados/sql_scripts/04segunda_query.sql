USE demonstracoes_contabeis;

SELECT 
    o.Razao_Social,
    o.Registro_ANS,
    o.CNPJ,
    o.Cidade,
    o.UF,
    SUM(d.vl_saldo_final) AS total_despesas
FROM (
    SELECT * FROM 1T2024
    UNION ALL
    SELECT * FROM 2T2024
    UNION ALL
    SELECT * FROM 3T2024
    UNION ALL
    SELECT * FROM 4T2024
) AS d
JOIN operadoras o 
    ON d.reg_ans = o.Registro_ANS
WHERE 
   YEAR(d.data) = 2024  -- Filtra dados do último ano completo (2024)
GROUP BY 
    o.Razao_Social, o.Registro_ANS, o.CNPJ, o.Cidade, o.UF
ORDER BY 
    total_despesas DESC
LIMIT 10;