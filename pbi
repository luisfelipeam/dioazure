SELECT
  CONCAT(g.Fname, ' ', g.Minit, ' ', g.Lname) AS Gerente,
  (SELECT COUNT(*) FROM employee AS e WHERE e.Super_ssn = g.Ssn) AS Empregado
FROM employee AS g
ORDER BY g.Ssn;

WITH EmployeeCount AS (
  SELECT Super_ssn, COUNT(*) AS NumEmpregados
  FROM employee
  GROUP BY Super_ssn
)

SELECT
  CONCAT(g.Fname, ' ', g.Minit, ' ', g.Lname) AS Gerente,
  ec.NumEmpregados AS Empregado
FROM employee AS g
LEFT JOIN EmployeeCount AS ec ON g.Ssn = ec.Super_ssn
ORDER BY g.Ssn;

SELECT
  CONCAT(g.Fname, ' ', g.Minit, ' ', g.Lname) AS Gerente,
  COUNT(e.Fname) AS Empregado
FROM employee AS g
LEFT JOIN employee AS e ON g.Ssn = e.Super_ssn
GROUP BY g.Ssn, g.Fname
ORDER BY g.Ssn;

Na esfera dos bancos de dados e consultas SQL, é importante discernir entre duas operações distintas: fusão e atribuição. A fusão se destina à amalgamação de valores de diferentes colunas,
criando uma única coluna para exibição, sem afetar os valores originais nas tabelas. Essa operação é puramente visual e temporária. Por outro lado, a atribuição implica modificações diretas
nos valores das colunas nas tabelas, o que resulta em alterações nos dados originais. No contexto em análise, que aborda a união dos nomes dos departamentos com suas respetivas localizações,
não se evidencia uma necessidade de atribuição de valores, uma vez que o intuito se limita à apresentação conjunta dos dados, sem exercer qualquer impacto sobre as informações originais nas tabelas.
O requisito para a atribuição somente se apresentaria caso houvesse o desejo de efetuar atualizações nas colunas de uma tabela, introduzindo novos dados.


