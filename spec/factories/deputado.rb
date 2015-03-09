FactoryGirl.define do
  factory :deputado do
    sequence(:nome)             { |n| "deputado#{n}" }
    sequence(:nome_parlamentar) { |n| "dep#{n}" }
    sequence(:email)            { |n| "email#{n}@deputado.com" }
    sequence(:matricula)        { |n| n }

    url_foto "http://url.com/foto"
    partido "PDSK"
    uf "KD"
    id_cadastro "12345"
  end
end
