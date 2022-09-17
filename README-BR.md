# On Fly - Aplicativo para realizar entregas com drone

Aplicativo desenvolvido como trabalho final para disciplina de Planejamento e Gestão de Projetos do curso de Engenharia de Computação da UFSC.

> Pode baixar todo o projeto [aqui](https://github.com/RaphaelRat/OnFly/files/9129053/Projeto_On_Fly.zip).


A ideia do app consiste em ser um aplicativo simples e prático para que o dono de um estabelecimento possa realizar entregas a partir dos seus drones e acompanhá-los em tempo real. Sendo assim, no app é possível cadastrar seu drone com suas características e suas limitações, após ter um drone cadastrado, você pode selecioná-lo para enviar e assim preencher com as informações necessárias para a entrega, como conteúdo, endereço e peso do conteúdo.

### Informações importantes

Todas as imagens dos drones foram tiradas do google e seus créditos estão no final do README.md. E as fotos de perfil dos usuários foram tiradas do Whatsapp dos membros da equipe do projeto (previamente autorizadas).

A proposta do trabalho era apresentar um documento de planejamento e gestão de um projeto ([Projeto_On_Fly.pdf](https://github.com/RaphaelRat/OnFly/files/9129010/Projeto_On_Fly.pdf)) e apresentar um pitch. Com isso a ideia do app surgiu apenas para ser um protótio de um projeto idealizado no documento citado, logo sem fins lucrativos.

Para testar o aplicativo, você precisar possuir um emulador Android, uma IDE que rode Flutter e o próprio Flutter instalado. Após abrir um projeto, basta executá-lo em modo debug ou então rodar o comando no cmd:

``` cmd 
flutter build apk --release
```

O arquivo gerado vai ser um .apk, basta enviar para seu celular e instalar. A última versão do app (como está nesse repositório) foi gerada e pode ser baixada [aqui](https://drive.google.com/uc?export=download&id=16Gq7x3j_gsNJT4XtW13hA9MPmooZKtHV) (pode ser instalada num emulador ou no próprio celular com Android).

E como o app não possui conexão com a internet e não possui nenhuma biblioteca de armazenamento de dados (por ser um simples protótipo), não é possivel criar uma conta, logo foram mockadas 3 contas que podem ser acessadas pelos emails abaixo, todos com a senha 123123.

> raphael@gmail.com  -> possui 4 drones
> 
> nicolas@gmail.com  -> possui 6 drones
> 
> matheus@gmail.com  -> possui 2 drones

O [documento](https://github.com/RaphaelRat/OnFly/files/9129010/Projeto_On_Fly.pdf) citado e cima foi escrito por [mim](https://github.com/RaphaelRat), pelo [Nicolas](https://github.com/nicolasbaumle) e pelo [Matheus](https://gist.github.com/matheuskolln).

---

Como a ideia do app é ser um protótipo para exemplificação de um projeto e o tempo foi curto (2 dias), muitas funções não foram implementadas, então o foco foi em deixar ele o mais explicatível possível. E como não da para criar uma conta, basta logar com uma das contas listadas acima para testar o app. E então basta iniciá-lo que a primeira página a ser exibida será a de perfil:

 >  <img src="https://user-images.githubusercontent.com/89277770/179373836-c1adb098-8263-469d-bfea-a03628645904.png" alt="Login" width="250"/>    <img src="https://user-images.githubusercontent.com/89277770/179372896-2d100612-af33-4b7c-9d80-c2ee96b9b333.png" alt="Login" width="250"/>     <img src="https://user-images.githubusercontent.com/89277770/179374006-dd0fce25-de4a-42f7-8c46-746d55e3b9a3.gif" alt="Login" width="250"/>  

Também não foi implementada a função de adicionar um drone, logo todos os drones exibidos foram mockados e a quantidade que cada perfil tem foi definido no mock do usuário. Então após login, você vai para a [HomePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/home/home_page.dart) abaixo, onde você pode tanto ir para o seu perfil, clicando na sua foto ou então clicar no drone que deseja acompanhar ou enviar para entrega.

> <img src="https://user-images.githubusercontent.com/89277770/179373071-85c90b11-f4a6-44f8-b83c-5d43ba0a177c.png" alt="Home" width="250"/>    <img src="https://user-images.githubusercontent.com/89277770/179373494-db5e5086-64e0-4263-9500-c3a7bfe23f77.gif" alt="Home" width="250"/> 

   
Após selecionar um drone, será aberta a [DronePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/drone/drone_page.dart), onde você poderá enviar um drone para entrega ou acompanha-lo em tempo real. Caso ele esteja disponível, você preenche os dados e envia, desde que respeite o limite de peso.  

>  <img src="https://user-images.githubusercontent.com/89277770/179374421-e2982074-7895-4265-9dec-2613b93af652.png" alt="Drone" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179374422-d018d066-55b9-4ee6-b654-001889c40b96.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179374473-93fce9de-779e-4753-8363-9645fad86959.gif" alt="Drone" width="250"/> 
 

Após clicar em enviar, ou abrindo um drone ja enviado e clicando no mapa, você vai para o "rastreador" onde você acompanha o drone em tempo real enquanto ele se dirige ao ponto de entrega. Além da ação de enviar, o card do drone fica também com um ícone de radar, para indicar que está sendo usado.

>  <img src="https://user-images.githubusercontent.com/89277770/179374662-c4d733d8-29d0-4cd6-997e-1cb306007a3e.png" alt="Drone" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179374740-f0a590d6-13c4-46d8-b35a-64c2f2d42da7.gif" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179374822-a72c0ece-d9c2-40d3-9ad4-c4b1f33dd5b4.gif" alt="Drone" width="250"/> 


Com a página do mapa aberta, ainda é possível fazer com que o drone retorne, deixando-o assim livre para fazer outra entrega.

>  <img src="https://user-images.githubusercontent.com/89277770/179375058-1f34f6b4-761d-435c-a675-9a5b7e217c93.gif" alt="Drone" width="250"/>


Retornando na página do drone, ainda é possivel clicar em seu card para exibir a foto dele.
 
> <img src="https://user-images.githubusercontent.com/89277770/179399053-906b8ac4-1ce4-47e2-b339-71dc07d2330a.png" alt="Drone" width="250"/>
 
E no card percebe-se o icone do radar, se está presente ou não, indicando se está em uso ou não.

 >  <img src="https://user-images.githubusercontent.com/89277770/179374659-0ed5b422-0c24-4dcd-a007-d190f37f2395.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399127-f53be2b5-6560-47b1-a291-f0891a06950e.png" alt="Drone" width="250"/>
 >
 >  <img src="https://user-images.githubusercontent.com/89277770/179399951-b4c2e657-0c78-4bfc-81e6-3f1e0f64d206.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399984-c284be1f-8866-47b4-9b95-98ae94b84269.png" alt="Drone" width="250"/>

Voltando apra a [HomePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/home/home_page.dart), pode-se ainda clicar na foto do perfil da pessoa para abrir seu perfil([PerfilPage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/profile/profile_page.dart)), para editar suas informações pessoais, como nome, email, senha e também para finalizar sessão.
 
>  <img src="https://user-images.githubusercontent.com/89277770/179399667-6b2dab98-0a02-4130-b3d2-96e70609492c.gif" alt="Profile" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179399685-7e9d38a4-f359-4a2b-b203-bbc2791775bc.png" alt="Profile" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399904-653dd4fb-9c97-4c00-af32-cb0162c617ba.gif" alt="Profile" width="250"/>
 
 
 ---

### Crédito das imagens utilizadas

Logo: [isTockphoto](https://www.istockphoto.com/br/vetor/drone-delivery-icon-flat-design-caixa-de-transporte-carregando-design-de-vetor-de-gm1253655064-366190733?phrase=drone%20delivery)

Drone 1: [Youtube](https://www.youtube.com/watch?v=w96LUQ6vueA&ab_channel=AureliaAerospace)

Drone 2: [IMGR](https://www.imrg.org/blog/coronavirus-impact-where-will-automation-in-retail-be-accelerated/)

Drone 3: [ITARC](https://itarc.org/corrida-de-drone/)

Drone 4: [PHOTOMKT](https://photomkt.com/servicio/drone/)

Drone 5: [Portal Vida Livre](https://portalvidalivre.com/articles/1301)

Drone 6: [TECHWORM](https://www.techworm.net/2022/04/dji-mini-3-pro-specs-photos-leaked.html)



 



