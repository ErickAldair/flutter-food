import 'package:flutter/material.dart';
import 'package:flutter_food/pages/detalle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text(
              'Comida a Domicilio',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 690,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(75),
                      bottomLeft: Radius.circular(75))),
              child: ListView(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 600,
                      child: GridView.count(
                        crossAxisCount: 2,
                        //mainAxisSpacing: 0.1,
                        childAspectRatio: 0.7,
                        children: [
                          _comidaItem(
                              'Salchipapa', 5, 'assets/images/papa.jpg'),
                          _comidaItem('hamgurguesa', 5,
                              'assets/images/hamburguesa.jpg'),
                          _comidaItem('Alias', 25, 'assets/images/alitas.png'),
                          _comidaItem(
                              'Burrito', 15, 'assets/images/burrito.png'),
                          _comidaItem(
                              'Hot Dog', 5, 'assets/images/hot_dog.png'),
                          _comidaItem('Pizza', 25, 'assets/images/pizza.png'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _comidaItem(String name, int price, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.grey[50],
        elevation: 5,
        child: Column(
          children: [
            Hero(
                tag: image,
                child: Material(
                  child: Container(
                    color: Colors.grey[20],
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetallePage(
                                name: name, price: price, image: image)));
                      },
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                )),
            const Padding(padding: EdgeInsets.all(3)),
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            Text(
              price.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
