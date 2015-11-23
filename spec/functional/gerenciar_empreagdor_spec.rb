# coding: utf-8

require 'rails_helper'

feature 'gerenciar Empregador' do

  scenario 'incluir Empregador' do # , :js => true  do

    visit new_empregador_path
    preencher_e_verificar_empregador
  end

  scenario 'alterar Empregador' do #, :js => true  do

    empregador = FactoryGirl.create(:empregador)
    visit edit_empregador_path(empregador)
    preencher_e_verificar_empregador

  end

   scenario 'excluir empregador' do #, :javascript => true  do

    empregador = FactoryGirl.create(:empregador)
    visit empregadors_path
    click_link 'Excluir'

  end

   def preencher_e_verificar_empregador

      fill_in 'Nome',     :with => "Luiz"
      fill_in 'Endereço',  :with => "Rua zero"
      fill_in 'Numero',     :with => "400"

      click_button 'Salvar'

      expect(page).to have_content 'Nome: Luiz'
      expect(page).to have_content 'Endereço: Rua zero'
      expect(page).to have_content 'Numero: 400'

   end
end
