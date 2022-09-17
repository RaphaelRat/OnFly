> To read in poruguese click [here](https://github.com/RaphaelRat/OnFly/blob/main/README-BR.md) | Para ler em português (🇧🇷) clique [aqui](https://github.com/RaphaelRat/OnFly/blob/main/README-BR.md).

# On Fly - An app for drone delivery using Flutter and GetX

This app was developed as a final work for the discipline of Planning and Project Management of the Computer Engineering course at [UFSC](https://en.ufsc.br/).

> Download full project [here](https://github.com/RaphaelRat/OnFly/files/9129053/Projeto_On_Fly.zip).


The idea of the app is to be a simple and practical application so that the owner of an establishment can make deliveries from their drones and follow them in real time. Therefore, in the app it is possible to register your drone with its characteristics and limitations, after having a drone registered, you can select it to send and thus fill in the necessary information for delivery, such as content, address and weight of the content.

### Disclaimer

All drone images were taken from google and their credits are at the end of README.md. And the users' profile pictures were taken from the project team members' Whatsapp (previously authorized).

The purpose of the work was to present a project planning and management document ([Projeto_On_Fly.pdf](https://github.com/RaphaelRat/OnFly/files/9129010/Projeto_On_Fly.pdf) - portuguese only) and present a pitch. With that, the idea of the app came just to be a prototype of a project idealized in the cited document, therefore non-profit.

To test the application, you need to have an Android or iOS emulator and an IDE that runs Flutter installed. After opening a project, just run it in debug mode or run the command in cmd:

``` cmd 
flutter run --release
```

> The latest version of the app was generated and can be downloaded [here](https://drive.google.com/uc?export=download&id=16Gq7x3j_gsNJT4XtW13hA9MPmooZKtHV) (can be installed on an emulator or on the cell phone with Android).

And as the app doesn't have an internet connection and doesn't have any data storage library (because it's a simple prototype), it's not possible to create an account, so 3 accounts were mocked that can be accessed by the emails below, all with the password 123123.

> raphael@gmail.com  -> has 4 drones
> 
> nicolas@gmail.com  -> has 6 drones
> 
> matheus@gmail.com  -> has 2 drones

The [document](https://github.com/RaphaelRat/OnFly/files/9129010/Projeto_On_Fly.pdf) cited above was written by [me](https://github.com/RaphaelRat), by [Nicolas](https://github.com/nicolasbaumle) and by [Matheus](https://gist.github.com/matheuskolln).

---

As the idea of the app is to be a prototype for the exemplification of a project and the time was short (2 days), many functions were not implemented, so the focus was on making it as explainable as possible. And since you can't create an account, just log in with one of the accounts listed above to test the app. And then just start it and the first page to be displayed will be the profile page:

 >  <img src="https://user-images.githubusercontent.com/89277770/179373836-c1adb098-8263-469d-bfea-a03628645904.png" alt="Login" width="250"/>    <img src="https://user-images.githubusercontent.com/89277770/179372896-2d100612-af33-4b7c-9d80-c2ee96b9b333.png" alt="Login" width="250"/>     <img src="https://user-images.githubusercontent.com/89277770/179374006-dd0fce25-de4a-42f7-8c46-746d55e3b9a3.gif" alt="Login" width="250"/>  

Also, the function of adding a drone was not implemented, so all the displayed drones were mocked and the amount that each profile has was defined in the user mock. Then after login, you go to the [HomePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/home/home_page.dart) below, where you can either go to your profile by clicking on your photo or clicking on the drone you want to track or send for delivery.

> <img src="https://user-images.githubusercontent.com/89277770/179373071-85c90b11-f4a6-44f8-b83c-5d43ba0a177c.png" alt="Home" width="250"/>    <img src="https://user-images.githubusercontent.com/89277770/179373494-db5e5086-64e0-4263-9500-c3a7bfe23f77.gif" alt="Home" width="250"/> 
  
After selecting a drone, [DronePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/drone/drone/drone_page.dart) will open, where you can send a drone for delivery or track it in real time. If it is available, you fill in the data and send it, as long as you respect the weight limit.

>  <img src="https://user-images.githubusercontent.com/89277770/179374421-e2982074-7895-4265-9dec-2613b93af652.png" alt="Drone" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179374422-d018d066-55b9-4ee6-b654-001889c40b96.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179374473-93fce9de-779e-4753-8363-9645fad86959.gif" alt="Drone" width="250"/> 
 
After clicking send, or opening a drone already sent and clicking on the map, you go to the "tracker" where you follow the drone in real time as it heads to the delivery point. In addition to the send action, the drone card also has a radar icon, to indicate that it is being used.

>  <img src="https://user-images.githubusercontent.com/89277770/179374662-c4d733d8-29d0-4cd6-997e-1cb306007a3e.png" alt="Drone" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179374740-f0a590d6-13c4-46d8-b35a-64c2f2d42da7.gif" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179374822-a72c0ece-d9c2-40d3-9ad4-c4b1f33dd5b4.gif" alt="Drone" width="250"/> 


With the map page open, it is still possible to make the drone return, thus leaving it free to make another delivery.

>  <img src="https://user-images.githubusercontent.com/89277770/179375058-1f34f6b4-761d-435c-a675-9a5b7e217c93.gif" alt="Drone" width="250"/>

Returning to the drone page, it is still possible to click on its card to display its photo.
 
> <img src="https://user-images.githubusercontent.com/89277770/179399053-906b8ac4-1ce4-47e2-b339-71dc07d2330a.png" alt="Drone" width="250"/>
 
And on the card you can see the radar icon, if it is present or not, indicating whether it is in use or not.

 >  <img src="https://user-images.githubusercontent.com/89277770/179374659-0ed5b422-0c24-4dcd-a007-d190f37f2395.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399127-f53be2b5-6560-47b1-a291-f0891a06950e.png" alt="Drone" width="250"/>
 >
 >  <img src="https://user-images.githubusercontent.com/89277770/179399951-b4c2e657-0c78-4bfc-81e6-3f1e0f64d206.png" alt="Drone" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399984-c284be1f-8866-47b4-9b95-98ae94b84269.png" alt="Drone" width="250"/>

Going back to [HomePage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/home/home_page.dart), you can also click on the person's profile picture to open their profile([PerfilPage](https://github.com/RaphaelRat/OnFly/blob/main/lib/app/modules/profile/profile_page.dart)), to edit your personal information such as name, email, password and also to end session.

>  <img src="https://user-images.githubusercontent.com/89277770/179399667-6b2dab98-0a02-4130-b3d2-96e70609492c.gif" alt="Profile" width="250"/> <img src="https://user-images.githubusercontent.com/89277770/179399685-7e9d38a4-f359-4a2b-b203-bbc2791775bc.png" alt="Profile" width="250"/>  <img src="https://user-images.githubusercontent.com/89277770/179399904-653dd4fb-9c97-4c00-af32-cb0162c617ba.gif" alt="Profile" width="250"/>
 
 
 ---

### Credit for used images

Logo: [isTockphoto](https://www.istockphoto.com/br/vetor/drone-delivery-icon-flat-design-caixa-de-transporte-carregando-design-de-vetor-de-gm1253655064-366190733?phrase=drone%20delivery)

Drone 1: [Youtube](https://www.youtube.com/watch?v=w96LUQ6vueA&ab_channel=AureliaAerospace)

Drone 2: [IMGR](https://www.imrg.org/blog/coronavirus-impact-where-will-automation-in-retail-be-accelerated/)

Drone 3: [ITARC](https://itarc.org/corrida-de-drone/)

Drone 4: [PHOTOMKT](https://photomkt.com/servicio/drone/)

Drone 5: [Portal Vida Livre](https://portalvidalivre.com/articles/1301)

Drone 6: [TECHWORM](https://www.techworm.net/2022/04/dji-mini-3-pro-specs-photos-leaked.html)



 



