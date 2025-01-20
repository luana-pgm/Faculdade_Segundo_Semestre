-- Primeira consulta: Selecionar os funcionários, clientes e produtos que compraram --


SELECT 
t1.Funcionario_id, 
t2.nome AS Nome_Funcionario,
t1.Cliente_id, 
t3.id AS Nome_Cliente,
t4.forma_pagamento, 
t1.Data_hora,
t6.descricao, 
t6.quantidade, 
t6.preco
FROM veterinaria.Venda t1
 
LEFT JOIN veterinaria.funcionario t2 ON
t1.Funcionario_id = t2.id
 
LEFT JOIN veterinaria.Cliente t3 ON
t1.Cliente_id = t3.id
 
LEFT JOIN veterinaria.pagamento t4 ON
t1.pagamento_id = t4.id
 
LEFT JOIN veterinaria.itens_venda t5 ON 
t1.id = t5.Venda_idVenda

LEFT JOIN veterinaria.Produto t6 ON
t5.Produto_id = t6.id;



-- Segunda consulta:  Recuperar o nome dos funcionários, valores e quantidades vendidas-- 

SELECT 
t2.nome AS Nome_Funcionario,
t4.forma_pagamento,  
SUM(t6.quantidade) AS Qdte_Total, 
(SUM(t6.quantidade) * SUM(t6.preco)) AS Valor_Total
FROM veterinaria.Venda t1
 
LEFT JOIN veterinaria.funcionario t2 ON
t1.Funcionario_id = t2.id
 
LEFT JOIN veterinaria.Cliente t3 ON
t1.Cliente_id = t3.id
 
LEFT JOIN veterinaria.pagamento t4 ON
t1.pagamento_id = t4.id
 
LEFT JOIN veterinaria.itens_venda t5 ON 
t1.id = t5.Venda_idVenda
 
LEFT JOIN veterinaria.Produto t6 ON
t5.Produto_id = t6.id
 
GROUP BY
t1.Funcionario_id, 
t4.forma_pagamento;


-- Terceira consulta: consulta que possua a cláusula ORDER BY --
SELECT 
t1.Cliente_id, 
t3.id AS Nome_Cliente, 
SUM(t6.quantidade) AS Qdte_Total, 
(SUM(t6.quantidade) * SUM(t6.preco)) AS Valor_Total
FROM veterinaria.Venda t1
 
LEFT JOIN veterinaria.funcionario t2 ON
t1.Funcionario_id = t2.id
 
LEFT JOIN veterinaria.Cliente t3 ON
t1.Cliente_id = t3.id
 
LEFT JOIN veterinaria.pagamento t4 ON
t1.pagamento_id = t4.id
 
LEFT JOIN veterinaria.itens_venda t5 ON 
t1.id = t5.Venda_idVenda
 
LEFT JOIN veterinaria.Produto t6 ON
t5.Produto_id = t6.id
 
GROUP BY 
t1.Cliente_id, 
t3.id
 
ORDER BY 
Valor_Total DESC;


-- Quarta consulta: consulta usando o operador LIKE --
SELECT 
t1.nome AS Nome_Animal, 
t1.especie, 
t1.idade, 
t1.peso, 
t2.nome AS Nome_Cliente
FROM veterinaria.Animal t1
 
LEFT JOIN veterinaria.Cliente t2 ON
t1.Cliente_id = t2.id
 
WHERE -- Filtrar nome de animal que termine com a letra "a"
t1.nome LIKE '%a';


-- Quinta consulta: Selecionar funcionários que tenham realizado vendas --
SELECT nome
FROM veterinaria.funcionario
WHERE EXISTS (
    SELECT 1
    FROM veterinaria.Venda
    WHERE Venda.Funcionario_id = funcionario.id
);


-- Sexta consulta: Selecionar produtos que nunca foram vendidos --
SELECT id, descricao
FROM veterinaria.Produto AS P
WHERE NOT EXISTS (
    SELECT 1
    FROM veterinaria.itens_venda AS IV
    WHERE IV.Produto_id = P.id
);

