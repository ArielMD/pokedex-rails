# README

Versión de ruby 2.7.2
versión de rails 6.1.4.4

### Instalación 

Instalar gemas 
```
bundle install
```

Instalar dependencias de JS 
``` 
bundle exec rake webpacker:instal
```

Compilar código 
```
bundle exec rake webpacker:compile
```

Crear base de datos
```
rails db:create
```

Ejecutar migraciones a la base de datos
```
rails db:migrate
```

### Ejecución 
Generar datos a través de un API
```
post "http://localhost:3000/api/pokedex"
```
