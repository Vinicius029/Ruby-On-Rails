# Curso de Ruby on Rails

## Repositório de estudo do Rails

### Iniciando o Projeto

* gem install ruby
* gem install rails 
* bundle install

### MVC
* MVC: MODELS(DADOS), VIEWS(VISUALIZAÇÕES), CONTROLLERS(CONTROLES)

* ActiveRecord: trabalha dos dados em rails

### Utilizando Scanffold

* Scaffold: O rails possui um generator chamado scaffold que permite criar um CRUD para uma determinada "tabela", 
crud é a criação de banco de dados, CREATE, READ, UPDATE, DELETE. Scaffold ele já gerar um campo pronto com com os atributos informados.

* Comando para criar um crud: rails g scaffold Coin descricao:string sigla:string imagem:string
     - rails db:migrate (migra os dados para o db)

* ORM: Object-Relational-Mapping: é uma tecnica que mapeas os dados em db para classes. ela converte as classes/objetos em algo que o db enteda

### Tasks

* rails db:create CRIA DB
* rails db:drop DELETA
* rails db:migrate MIGRA
* rails db:rollback DESFAZ ULTIMA MIGRAÇÃO

### Criando Controllers

* rails g controller teste: criar generator controller
* rails d controller teste: excluí o controllers

    - app/views/teste.html.erb: view do controller teste

### Criando rotas

* app/config/routes.rb (Para editar o caminho)

* get 'welcome/index' (faz a rota welcome/index)
resources :coins (AS SETE ROTAS GET, POST, DELETE ETC)

* root to: "vinicius#index" (Quando acessar localhost:3000 cai na pagina vinicius/index)

### Helpers

* helpers criar metodos para utilizar em nossa aplicação

* app/helpers/welcome
* welcome_helper.rb
 def falar
	"oi"
end

* Em app/views/welcome/welcome.index.html.erb

    - <p> <%= falar %></p>

### Rails Console

* Deixa você interagir com aplicação atraves da linha de comando, utilizando: rails console ou rails c.

    - c = Coin.new
    - c.descricption = "real"
    - c.sigla = "R$"
    - c.url = "https//.."
    - c.save! 

###  Query Params Para Requests

* app/controllers/(arquivo) 
    - def index
        @nome = params[:nome]
        @curso = params[:curso]
    end

app/views/index
<p>Nome: <%= @nome %> Meu curso é <%= @curso %></p>(Mostra os elementos dos parametros) 

* localhost:3000/?nome=Vinicius&curso=Rails (set nos nos atributos pela url)


### Partials 

* Permite você rendezirar uma views dentro de outra.

* app/views/welcome(no arquivo index.html)

   - <%= render "menu"%>

* app/views/welcome(no arquivo menu.html)
* sempre tem que criar o arquivo com "_" _menu.html.erb

 <a href="/coins"> Cadastro de Moedas </a>


### LAYOUT

Sempre que a pagina é localhost:3000/welcome/index é carregada, o arquivo layout/application é carregada também,
ela é html da pagina toda, podemos colocar coisas que apareceram em todas as paginas do site, ex: cabeçalho, todas 
as paginas terá cabeçalho.

* app/views/layout/application.html.erb
    - Cabeçalho terá em toda páginas 
    <h3>Cabeçalho Application</h3>
    <%= yield %> (yield é o conteúdo todo da pagina)
    <br>

* app/views/layout/adm.html.erb

  - Cabeçalho apenas do coin.html.erb
    <h3>Cabeçalho Adm</h1> 
    <%= yield %> 

* em app/controllers/coins_controller.erb

    - layout "adm" (Para c)
