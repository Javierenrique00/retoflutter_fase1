# flutter_application_1

Se creo este proyecto usando el comando de visual code : flutter new apllication

# Descripción general

El proyecto consta de 3 pantallas principales, en las cuales se navega mediante las rutas nombradas "named routes"

Se crearon 3 capas así: data -> domain -> presentation

En la capa de datos se manejan los datasource y los repositorios. Estos en este momento tienen una implementación mokeada de donde se extraen los datos quemados en el app.

Los paquetes adicionales que se han instalado son:
- Provider, para el manejo de viewModels
- Intl, para poder manejar el formato de dinero ($)

Dado que los datos no los estamos almacenando realmente en un repo local (Sharepreferences o database), los datos se cargan al AppViewModel cuando inicia el app, y toda la interacción con estos, ya sea agregar campos, eliminar o editar se hace directamente sobre el viewModel. Si se quisiera que estos datos tengan persistencia se puede hacer simplemente salvando el estado del viewModel al datasource correspondiente.

Cuando inicia el app se crea el viewModel, el cual podría ser accedida por las pantallas, en este caso la de Home y la del Form, las cuales hacen los cambios sobre la data almacenada en el viewModel.

Cuando se crean un nuevo registro de datos se hace una validación en la forma de manera que no se pueden dejar campos vacíos ni de tamaño superior al requerido, por ejemplo para el nombre del producto se aceptan hasta 15 caracteres. Cuando se ingresan los números, se activa un teclado solo numérico y se valida que lo que se ingrese se pueda parsear exitosamente para poderlo ingresar correctamente.

