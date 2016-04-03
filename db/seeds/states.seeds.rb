require 'net/http'

uri = URI('https://raw.githubusercontent.com/felipefdl/cidades-estados-brasil-json/master/Estados.json')
states = JSON.parse Net::HTTP.get(uri)

states.each do |state|
  State.where(name: state['Nome']).first_or_create
end
