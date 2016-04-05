# Desafio de Segmentação: Profiles

Considerando a proposta do desafio e requisitos necessários, foi desenvolvida a seguinte solução:

### Manter um cadastro de contatos

A proposta descreve a necessidade de manter um **cadastro de contatos**, mas não informa a origem ou como os dados devem ser inseridos.

Utilizando esta informação como ponto de partida, foi desenvolvido um aplicativo colaborativo onde os usuários podem visualizar e segmentar os demais perfis cadastrados.

Ou seja, qualquer usuário tem permissão para ver e segmentar outros perfis desde que, se cadastre e compartilhe seu perfil com os demais.

### Segmentação de Usuários

A **segmentação de usuários** acontece através da caixa de pesquisa. As opções disponíveis são:


- Segmentar perfis que atendam:
  - Todas as condições
    - O perfil do usuário deve satisfazer todos os campos preenchidos
  - Qualquer uma das condições
    - O perfil do usuário deve satisfazer qualquer um dos campos preenchidos

- Idade:
  - Igual a
  - Maior que
  - Menor que

- Cargo:
  - Igual a
  - Diferente de
  - Contém
  - Não contém

- Estado

### Salvar critérios de segmentação

Ao aplicar uma segmentação, o usuário terá a opção de salvá-la.

A segmentação salva ficará disponível apenas no perfil do usuário ou seja, cada usuário no sistema tem suas próprias segmentações.

### Editar perfil

O usuário tem permissão para editar seu próprio perfil.

Ao fazer isso, todas segmentações que impactam no seu perfil, serão refletidas.

## Links

- A aplicação pode ser acessada e utilizada no seguinte link: http://prfiles.herokuapp.com.
- O código fonte está disponível no seguinte repositório: http://github.com/alesshh/profiles.

## Créditos
Autor: [Alessandro Tegner](mailto:alessandro.tegner@gmail.com)
