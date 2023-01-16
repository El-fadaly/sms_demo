# sms_demo

app to fetch messages  from phone  and  filter  them using  clean architecture and change Notifier Provider State Management 


the  architecture  consists  of   

    App :  which is  the foundation for  the  app 
    |   
     - dependencies : which includes the  dependencies injection for app 
     - helpers : for  permissions and  type parser and  User Interactions  for  all app accessibilty 
     - view  : 
        - config : contains size config  and  other  config  
        - resources : cotains  string , images , styles  and themmes 
        - routing  : decalring   the  app routing  cases 
        - app.dart : which is  the  entry point  for  the  app  
     
    features  : icludes all app features every feature in separated  folder containing  all its logic 
    |
        - sms : first feature 
           - data  : is  the  most outter layer  which is  responsible  for  getting  data from apis  or  services  
                - models  : is the  dto models  for  the  returning  data
                - repository  : is  for  the  connection to outter services  
           - dependencies : is the  dependencies for  the  specific feature 
           - domain : is  the  most inner layer  which contains bussiness logic
           - presentation :  is  the  layer for  showing the  user  the  app ui and  gets  its  interaction 
                - state : conatins the  app state mangemnet  using Change Notifier Provider     
                - views : contains the  screens
                - widgets : contains widgets used  to build  the  screens  
    main.dart. 





## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
