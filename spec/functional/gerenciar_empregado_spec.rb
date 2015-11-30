# coding: utf-8

require 'spec_helper'

feature 'gerenciar empregado' do

  before(:each) do
    @empregador = create(:empregador, nome: "Gustavo")
  end


  let(:dados) do {

    nome: "Matematica",
    endereco: "Rua XXXXX",
    cidade: "Campos",
    empregador: "Gustavo"
   }
  end

  scenario 'incluir empregado' do #, :js => true  do
    visit new_empregado_path
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)

  end

  scenario 'alterar disciplina' do #, :js => true  do

    empregado = FactoryGirl.create(:empregado, empregador: @empregador )

    visit edit_empregado_path(empregado)
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)


  end

  scenario 'excluir empregado' do #, :js => true  do

    empregado = FactoryGirl.create(:empregado, empregador: @empregador)
    visit empregados_path
    #save_and_open_page
    click_link 'Excluir'

  end

  def preencher(dados)

    fill_in 'Nome',  with: dados[:nome]
    fill_in 'Endereço',  with: dados[:endereco]
    fill_in 'Cidade', with: dados[:cidade]
    select dados[:empregador], from: "Empregador"

  end

  def verificar(dados)

    page.should have_content "Nome: #{dados[:nome]}"
    page.should have_content "Endereço: #{dados[:endereco]}"
    page.should have_content "Cidade: #{dados[:cidade]}"
    page.should have_content "Empregador: #{dados[:empregador]}"

  end

end
