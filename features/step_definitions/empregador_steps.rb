#Criar empregador

Given('O empregador de nome: {string}, nomeEmpresa: {string}, email: {string}, endereco: {string}, telefone: {string}, cnpj: {string} existe') do |nome , nomeEmpresa, email, endereco, telefone, cnpj|
  visit '/empregadors/new'
  fill_in 'empregador[nome]', :with => nome
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
  fill_in 'empregador[endereco]', :with => endereco
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[cnpj]', :with => cnpj
end

And("estou na pagina do empregador com nome {string}") do |nome|
  visit "/empregadors/#{nome}"
end

When('eu clico em criar Empregador') do
  click_button 'Create Empregador'
  visit '/empregadors'

end

Then('eu vejo uma mensagem que informa que o empregador foi criado com sucesso')do
  page.has_content?('Empregador was successfully created.')
end

#Editar empregador

When('preencho os campos que desejo atualizar: email: {string}, nomeEmpresa: {string}')do |email, nomeEmpresa|
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
end
And('Clico em "Editar Empregador"')do
  click_button 'Edit Empregador'
end
Then('eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso')do
  page.has_content?('Empregador was successfully edited.')
end


#Remover empregador

When('eu clico no botão de excluir do empregador')do
  click_button 'Excluir empregador'
end

Then('eu vejo uma mensagem que informa que o empregador foi excluído com sucesso')do
  page.has_content?('Empregador was successfully destroyed.')
end

#Cadastrar sem sucesso 1
Given('Estou na pagina de cadastrar um empregador')do
  visit '/empregadors/new'
end

When('Preencho os campos de cadastro com os seguintes dados: nome: {string}, nomeEmpresa: {string}, email: {string}, endereco: {string}, telefone: {string}, cnpj: {string}')do |nome , nomeEmpresa, email, endereco, telefone, cnpj|
  fill_in 'empregador[nome]', :with => nome
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
  fill_in 'empregador[endereco]', :with => endereco
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[cnpj]', :with => cnpj
end


Then('eu vejo uma mensagem que informa que o empregador não pode ser cadastrado com esse email')do
  page.has_content?('Este email não pode ser cadastrado')
end

#Cadastrar sem sucesso 2

Then('eu vejo uma mensagem que informa que o empregador não pode ser cadastrado com esse nome')do
  page.has_content?('Este nome não pode ser cadastrado')
end