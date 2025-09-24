import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para cambiar el color del status bar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Rústica Gourmet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Registro de Usuario'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controladores para los campos de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _direccionController = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el widget se destruye
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cambiar el color del status bar a blanco (opcional, para que el texto sea visible)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Fondo blanco para el status bar
        statusBarIconBrightness:
            Brightness.dark, // Iconos oscuros (para fondo blanco)
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Fondo blanco para la barra de título
        title: Text(widget.title, style: const TextStyle(color: Colors.teal)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pizza_background.jpg',
            ), // Imagen de fondo (pizza y mantel)
            fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  // 👈 Aquí está la solución
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Logo de Pizza Rústica Gourmet
                      Image.asset(
                        'assets/images/logo_pizza_rustica.jpg', // Ruta de la imagen del logo
                        width: 150, // Ancho del logo
                        height: 150, // Alto del logo
                        fit: BoxFit
                            .contain, // Ajusta el logo dentro de los límites
                      ),
                      const SizedBox(
                        height: 10,
                      ), // Espacio entre el logo y el título
                      const Text(
                        'PIZZA RÚSTICA GOURMET',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // Espacio entre el título y los campos
                      // Campo: Nombre completo
                      TextField(
                        controller: _nombreController,
                        decoration: InputDecoration(
                          labelText: 'Nombre completo',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Campo: Correo electrónico
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      // Campo: Contraseña
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      // Campo: Confirmar contraseña
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirmar contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      // Campo: Dirección
                      TextField(
                        controller: _direccionController,
                        decoration: InputDecoration(
                          labelText: 'Dirección',
                          prefixIcon: const Icon(Icons.location_on),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Botón de Registrar
                      ElevatedButton(
                        onPressed: () {
                          // Aquí iría la lógica para registrar al usuario
                          // Por ahora, solo mostramos un mensaje
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('¡Registro exitoso!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Botón rojo
                          foregroundColor: Colors.white, // Texto blanco
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Registrarse'),
                      ),
                      const SizedBox(height: 10),
                      // Texto de "¿Ya tienes cuenta? Inicia sesión"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿Ya tienes cuenta? "),
                          GestureDetector(
                            onTap: () {
                              // Aquí iría la lógica para ir a la pantalla de inicio de sesión
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Ir a iniciar sesión'),
                                ),
                              );
                            },
                            child: const Text(
                              "¡Inicia sesión!",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
