import 'package:flutter/material.dart';

import '../widgets/containerImageCarousel.dart';
import '../widgets/rowTextIcon.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Container(alignment: Alignment.topLeft, child: Text('CineHub')),
            SizedBox(
              height: 40,
              child: SearchBar(
                hintText: "Rechercher un film",
                leading: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.heightOf(context) / 5),
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.heightOf(context) / 2,
                  child: Image.network(
                    "https://imgs.search.brave.com/TC2AbDgXCDsk_r0QWrF_yAs7qkgNNopeNaLsr-e-UdM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9saDMu/Z29vZ2xldXNlcmNv/bnRlbnQuY29tL0lD/bkZlMWtlMTB4YUto/MTh3YzlGemFvMTZD/Um1JN0NVR0M5OGZY/TDJkNTVfS2xuZExQ/bmVZbG9vaXMteE1n/VmJqOHV1Qm5od2l0/bEktN2Z0UDhKcjJR/MnFGR3dFUExLVVhC/MXZCWVhmbjRJPXcx/NDQwLWg4MTAtbi1u/dQ",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.widthOf(context),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("en vente"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mission Impossible",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Un agent secret doit sauver le monde d'une menace imminente. Action, suspense et rebondissements garantis. Ajoutez votre clé API",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Voir les détail'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Au cinéma maintenant"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ],
                  ),
                  ContainerImageCarousel(),
                  SizedBox(height: 20),
                  RowTextIcon(
                    text: "Top 10 du moment",
                    icon: Icons.arrow_forward_ios_sharp,
                  ),
                  SizedBox(height: 20),
                  ContainerImageCarousel(),
                  RowTextIcon(
                    text: "Les mieux notés",
                    icon: Icons.arrow_forward_ios_sharp,
                  ),
                  ContainerImageCarousel(),
                  RowTextIcon(
                    text: "prochains films",
                    icon: Icons.arrow_forward_ios_sharp,
                  ),
                  ContainerImageCarousel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
