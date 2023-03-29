import 'package:flutter/material.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _count = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade700,
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        title: const Text('مسبحة الأذكار', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              shadowColor: Colors.cyan,
              onSelected: (value) {
                setState(() {
                  if (_content != value) {
                    setState(() {
                      _content = value;
                      _count = 0;
                    });
                  }
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('الحمدلله'),
                    value: 'الحمدلله',
                  ),
                  const PopupMenuItem(
                    child: Text('أستغفر الله'),
                    value: 'أستغفر الله',
                  ),
                  const PopupMenuItem(
                    child: Text('لا اله الا الله'),
                    value: 'لا اله الا الله',
                  ),
                ];
              }),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/about_screen');

          },
              icon: Icon(Icons.info))
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/736x/0c/5f/cd/0c5fcd180d005b23de12aeafd4275e9a.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              foregroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaM8qGNkuHAe_omXi-szE1Ubh2ozDlOMv3m2C87PMz6xzf_OegcYIDwb6GJ3sd0TG_nCw&usqp=CAU'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 78,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                    DecoratedBox(
                        decoration: BoxDecoration(color: Colors.teal),
                        child: SizedBox(
                          width: 50,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              _count.toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _count++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade800,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(13)))),
                        child: Text('تسبيح'),
                      )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade900,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13)))),
                    child: const Text(
                      'إعادة',
                      style: TextStyle(),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
