import 'package:flutter/material.dart';

class DetallePage extends StatefulWidget {
  final String name;
  final int price;
  final String image;
  const DetallePage(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  int _counter = 0;
  int _total = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void calculat() {
    var numero1 = widget.price;
    int numero2 = _counter;
    int result = numero1 * numero2;
    setState(() {
      _total = result;
      print('$_total');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.restaurant_menu))
        ],
        centerTitle: true,
        title: const Text(
          'DETALLE',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 4),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
      ),
      backgroundColor: Colors.red,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 102,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 630,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        bottomRight: Radius.circular(45))),
              ),
              Positioned(
                top: 300,
                right: 1,
                child: Hero(
                    tag: widget.image,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(75)),
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.scaleDown,
                          )),
                      width: 200,
                      height: 200,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Precio:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.price.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cantidad: $_counter',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 6,
                                color: Colors.blue,
                                offset: Offset(0.0, 0.1))
                          ],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(75),
                              bottomLeft: Radius.circular(75))),
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          IconButton(
                              onPressed: () {
                                incrementCounter();
                                calculat();
                              },
                              icon: const Icon(Icons.add)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.fiber_smart_record)),
                          IconButton(
                              onPressed: () {
                                if (_counter > 0) {
                                  decrementCounter();
                                }
                                calculat();
                              },
                              icon: const Icon(Icons.remove)),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
