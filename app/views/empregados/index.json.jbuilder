json.array!(@empregados) do |empregado|
  json.extract! empregado, :id, :nome, :endereco, :cidade, :empregador_id
  json.url empregado_url(empregado, format: :json)
end
