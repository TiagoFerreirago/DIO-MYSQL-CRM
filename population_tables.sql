use crm;

-- Ordem: tabelas pai primeiro (Users, Funnel_Stages, Products, Clientes),
-- depois as que dependem delas por FK (Enderecos, Business, Business_Items, Activities).

-- 1. USERS (senhas fictícias; em um sistema real guarde apenas hash)
insert into users (nameComplete, email, passwordUser, position) values
('Marcos Oliveira',   'marcos.oliveira@crmexemplo.com', 'senha_ficticia_01', 'Gerente Comercial'),
('Patrícia Almeida',  'patricia.almeida@crmexemplo.com', 'senha_ficticia_02', 'Vendedora'),
('Rafael Mendes',     'rafael.mendes@crmexemplo.com',   'senha_ficticia_03', 'Vendedor'),
('Juliana Barros',    'juliana.barros@crmexemplo.com',  'senha_ficticia_04', 'SDR');

-- 2. FUNNEL_STAGES (orderFunnel é int)
insert into funnel_stages (stageName, orderFunnel) values
('Prospecção',      1),
('Qualificação',    2),
('Proposta',        3),
('Negociação',      4),
('Fechado Ganho',   5),
('Fechado Perdido', 6);

-- 3. PRODUCTS
insert into products (productName, basePrice, category, SKU) values
('Plano CRM Básico (Anual)',        1200.00, 'Software',     'CRM001'),
('Plano CRM Profissional (Anual)',  3600.00, 'Software',     'CRM002'),
('Plano CRM Enterprise (Anual)',    9600.00, 'Software',     'CRM003'),
('Implantação e Configuração',      2500.00, 'Serviço',      'SRV001'),
('Treinamento de Equipe',           1800.00, 'Serviço',      'SRV002'),
('Consultoria Comercial (hora)',     250.00, 'Consultoria',  'CON001'),
('Integração WhatsApp',              900.00, 'Software',     'INT001'),
('Suporte Premium (Anual)',         1500.00, 'Serviço',      'SUP001');

-- 4. CLIENTES (pessoa física: CPF obrigatório; CPFs fictícios, sem validade real)
insert into clients (nameComplete, CPF, dateBirth, email, phone, registrationDate) values
('Ana Beatriz Silva',      '20000000001', '1990-03-15', 'ana.silva@email.com',        '71991110001', '2026-05-02'),
('Bruno Carvalho Costa',   '20000000002', '1985-07-22', 'bruno.costa@email.com',      '21991110002', '2026-08-20'),
('Carla Souza Ribeiro',    '20000000003', '1992-11-05', 'carla.ribeiro@email.com',    '41991110003', '2026-08-01'),
('Diego Lima Santos',      '20000000004', '1988-01-30', 'diego.santos@email.com',     '11991110004', '2026-05-10'),
('Elisa Rocha Martins',    '20000000005', '1995-09-18', 'elisa.martins@email.com',    '81991110005', '2026-10-03'),
('Felipe Alves Pinto',     '20000000006', '1983-04-12', 'felipe.pinto@email.com',     '31991110006', '2026-09-15'),
('Gabriela Nunes Duarte',  '20000000007', '1997-12-01', 'gabriela.duarte@email.com',  '85991110007', '2026-06-25'),
('Henrique Matos Teixeira','20000000008', '1980-06-25', 'henrique.teixeira@email.com','51991110008', '2026-10-08'),
('Isabela Freitas Gomes',  '20000000009', '1999-02-14', 'isabela.gomes@email.com',    '62991110009', '2026-09-05'),
('João Pedro Pereira',     '20000000010', '1991-08-09', 'joao.pereira@email.com',     '92991110010', '2026-09-28');

-- 5. ENDERECOS (o cliente 1 tem dois endereços; o cliente 10 ainda não tem nenhum)
insert into address (idClient, street, numberHouse, complement, neighborhood, city, state, cep) values
(1, 'Rua das Flores',        '120',  'Apto 301', 'Pituba',          'Salvador',       'BA', '41810000'),
(1, 'Av. Tancredo Neves',    '2500', 'Sala 504', 'Caminho das Árvores', 'Salvador',   'BA', '41820021'),
(2, 'Av. Brasil',            '450',  null,       'Centro',          'Rio de Janeiro', 'RJ', '20040002'),
(3, 'Rua Chile',             '78',   'Casa 2',   'Batel',           'Curitiba',       'PR', '80420000'),
(4, 'Av. Paulista',          '1500', 'Sala 12',  'Bela Vista',      'São Paulo',      'SP', '01310100'),
(5, 'Rua da Aurora',         '33',   null,       'Boa Vista',       'Recife',         'PE', '50050000'),
(6, 'Rua Sergipe',           '210',  'Bloco B',  'Funcionários',    'Belo Horizonte', 'MG', '30130170'),
(7, 'Av. Beira Mar',         '900',  'Apto 802', 'Meireles',        'Fortaleza',      'CE', '60165121'),
(8, 'Rua XV de Novembro',    '55',   null,       'Centro Histórico','Porto Alegre',   'RS', '90020010'),
(9, 'Rua Goiás',             '14',   'Casa',     'Setor Central',   'Goiânia',        'GO', '74005010');

-- 5. BUSINESS (closingDate é NOT NULL no schema atual, então usei a data prevista de fechamento)
-- Estágios: 1 Prospecção, 2 Qualificação, 3 Proposta, 4 Negociação, 5 Fechado Ganho, 6 Fechado Perdido
-- estimatedValue = soma dos itens de cada negócio
insert into business (idClient, idUser, idStage, creationDate, closingDate, estimatedValue) values
(1, 2, 5, '2026-06-10', '2026-07-05',  6100.00),
(2, 3, 3, '2026-09-01', '2026-10-30',  3300.00),
(3, 2, 4, '2026-08-15', '2026-11-15', 10800.00),
(4, 3, 6, '2026-05-20', '2026-06-30',  3600.00),
(5, 4, 1, '2026-10-05', '2026-12-10',  1200.00),
(6, 2, 2, '2026-09-20', '2026-11-30',  8300.00),
(7, 3, 5, '2026-07-02', '2026-07-28',  2100.00),
(8, 4, 1, '2026-10-10', '2026-12-20',  2500.00),
(9, 2, 3, '2026-09-10', '2026-11-20', 13600.00),
(1, 3, 2, '2026-10-01', '2026-11-10',  2800.00);

-- 6. BUSINESS_ITEMS (sellingPrice é o preço unitário praticado, que pode ter desconto sobre basePrice)
insert into business_items (idProduct, idBusiness, quantity, sellingPrice) values
(2,  1,  1, 3600.00),
(4,  1,  1, 2500.00),
(1,  2,  2, 1200.00),
(7,  2,  1,  900.00),
(3,  3,  1, 9000.00),
(5,  3,  1, 1800.00),
(2,  4,  1, 3600.00),
(1,  5,  1, 1200.00),
(2,  6,  2, 3400.00),
(8,  6,  1, 1500.00),
(1,  7,  1, 1200.00),
(7,  7,  1,  900.00),
(6,  8, 10,  250.00),
(3,  9,  1, 9600.00),
(4,  9,  1, 2500.00),
(8,  9,  1, 1500.00),
(5, 10,  1, 1800.00),
(6, 10,  4,  250.00);

-- 7. ACTIVITIES
insert into activities (idClient, idUser, typeActivity, descriptionActivity, dateTimeActivity) values
(1, 2, 'Phone',    'Primeiro contato e levantamento de necessidades',      '2026-06-08'),
(1, 2, 'Email',    'Envio da proposta do plano Profissional',              '2026-06-15'),
(1, 2, 'WhatsApp', 'Confirmação de fechamento e envio do contrato',        '2026-07-03'),
(2, 3, 'Visit',    'Demonstração do sistema no escritório do cliente',     '2026-09-03'),
(3, 2, 'Phone',    'Negociação de desconto no plano Enterprise',           '2026-10-02'),
(4, 3, 'Email',    'Cliente informou que escolheu outra solução',          '2026-06-28'),
(5, 4, 'WhatsApp', 'Primeiro contato após cadastro no site',               '2026-10-06'),
(6, 2, 'Phone',    'Qualificação: equipe de 12 vendedores',                '2026-09-22'),
(7, 3, 'Visit',    'Reunião de fechamento e assinatura',                   '2026-07-27'),
(8, 4, 'Email',    'Envio de material institucional',                      '2026-10-11'),
(9, 2, 'WhatsApp', 'Envio da proposta com implantação e suporte',          '2026-09-14'),
(1, 3, 'Phone',    'Oferta de treinamento e consultoria como upsell',      '2026-10-01');