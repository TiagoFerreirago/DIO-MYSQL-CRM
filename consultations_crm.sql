show tables;

select * from  activities;
select * from business;
select * from  business_items;
select * from  clients;
select * from address;
select * from  funnel_stages;
select * from products;
select * from users;

-- ---------------------------------------------------------------
select * from  activities where typeActivity = 'Phone';
select * from business where estimatedValue >= 5000;
select * from  business_items where sellingPrice < 2000;
select * from  clients where dateBirth > 1990-01-01;
select * from address where state = 'BA' or state = 'PE';
select stageName from  funnel_stages;
select * from products where category = 'Software';
select * from users where position = 'Vendedor' or position = 'Vendedora';

-- -----------------------------------------------------------------------

select * from business b join clientes c on c.idClient = b.idClient
join users u on u.idUser = b.idUser join funnel_stages f on f.idStage = b.idStage;

select * from clients c join address a on a.idClient = c.idClient;

select * from products p join business_items b on b.idProduct = p.idProduct;

select * from clients c join activities a on a.idClient = c.idClient 
join users u on u.idUser = a.idUser;

-- -----------------------------------------------------------------------------------

select c.idClient, c.nameComplete, c.phone, u.email, count(a.idActivity) as atividades_por_pessoa from clients c left join activities a on a.idClient = c.idClient 
left join users u on u.idUser = a.idUser group by c.idClient, c.nameComplete, u.email order by c.idClient;

select SKU, productName, sum(b.sellingPrice * b.quantity) as valor_vendido, (case
 when sum(b.sellingPrice * b.quantity) >= 10000 then 'Alto'
 when sum(b.sellingPrice * b.quantity) >= 4000  then 'Médio'
 else 'Baixo' end) as faixa_receita
from products p join business_items b on b.idProduct = p.idProduct group by SKU, productName;

select c.idClient, c.nameComplete, timestampdiff(year, c.dateBirth, curdate()) as idade
from clients c where timestampdiff(year, c.dateBirth, curdate()) > 35
and exists (select 1 from address a where a.idClient = c.idClient) order by idade;

select u.nameComplete, sum(timestampdiff(day, creationDate, closingDate)) as total_dias_negociação,
round(avg(timestampdiff(day, creationDate, closingDate)),2) as media_dias_negociação from business b join clients c on c.idClient = b.idClient
join users u on u.idUser = b.idUser group by u.nameComplete;