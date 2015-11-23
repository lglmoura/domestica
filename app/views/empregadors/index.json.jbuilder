json.array!(@empregadors) do |empregador|
  json.extract! empregador, :id, :nome, :endereco, :numero
  json.url empregador_url(empregador, format: :json)
end
