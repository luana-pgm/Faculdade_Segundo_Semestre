## Proposta do Projeto
Criação de um Mine Mundo, em que tivemos que criar uma situação-problemas, que envolvesse uma empresa ficticia.


## Metodologia Aplicada
1 - Criação da situação-problema: A necessidade de produtos e serviços veterinários é evidente em diversos contextos contemporâneos, desde check-ups regulares até cirurgias, garantindo o bem-estar dos animais de estimação. 

2 - Especificação do que seria realizado: Sistema Patas (v1.0), sendo um banco de dados para uma clínica veterinária, que gerencia o agendamento de serviços e produtos. Em particular o cliente é identificado pelo CPF, sendo ele sua chave primária, em sequência por nome, telefone, e-mail, e endereço sendo composto por UF, CEP, número e bairro. Um cliente possui um animal, e um animal está associado a um cliente. O animal é identificado por ID sendo ele sua chave primária, em sequência por espécie, raça, idade, peso e nome; o mesmo utiliza diversos serviços, o qual se identifica por ID, descrição e preço, sendo que, estes serviços devem ser solicitados pelo cliente. Os serviços são prestados por um funcionário, o qual é identificado por CPF sendo está sua chave primária, em sequência por nome, telefone e e-mail. Um serviço contém muitos produtos, sendo este identificado por ID como chamo primária, descrição, quantidade e preço. Diversos produtos, são fornecidos por vários fornecedores, o qual é identificado por CNPJ como chave primária, nome, telefone, e-mail, e endereço, sendo composto por UF, CEP, número e bairro. Assim, o cliente pode solicitar vários produtos, contidos em uma venda, identificada por ID como chave primária, valor, data, e hora, tendo relação com o pagamento, sendo este identificado por ID como chave primária e forma de pagamento, esta venda será realizada pelo funcionário, e paga pelo cliente. 

3 - Levantamento dos Requisitos funcionais: Ao total levantamos 19

4 - Criação das tabelas pelo bando de dados SQLServer


## Objetivos
O objetivo deste repositório é apenas demonstrar os modelos usados em nosso projeto da faculdade
