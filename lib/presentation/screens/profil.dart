import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Stack(
        children: [
          Column(
            children: [
              // ================= HEADER ROUGE =================
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFE50914)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      child: Icon(Icons.person, size: 45),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Utilisateur CineHub",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email, color: Colors.white70, size: 14),
                        SizedBox(width: 5),
                        Text(
                          "utilisateur@example.com",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ================= CONTENU ==================
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50, // réduit pour que tout rentre
                    left: 14,
                    right: 14,
                  ),
                  child: Column(
                    children: [
                      // ---- CARDS ----
                      _buildCard(
                        icon: Icons.settings,
                        title: "Paramètres",
                        subtitle: "Gérer vos préférences",
                      ),

                      _buildCard(
                        icon: Icons.notifications,
                        title: "Notifications",
                        subtitle: "Gérer les notifications",
                      ),

                      _buildSwitchCard(),

                      _buildCard(
                        icon: Icons.help,
                        title: "Aide & Support",
                        subtitle: "Besoin d'aide ?",
                      ),

                      // ---- BOUTON ----
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE50914),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Se déconnecter",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "CineHub v1.0.0",
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ================= CARTE CHEVAUCHANTE =================
          Positioned(
            left: 18,
            right: 18,
            top: 170, // ajusté pour meilleure compacité
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _statsColumn("0", "Films vus"),
                  _divider(),
                  _statsColumn("0", "Favoris"),
                  _divider(),
                  _statsColumn("0", "Listes"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================== WIDGETS ======================

class _statsColumn extends StatelessWidget {
  final String count;
  final String label;
  const _statsColumn(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

class _divider extends StatelessWidget {
  const _divider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 24, color: Colors.white24);
  }
}

Widget _buildCard({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color(0xFF1E1E1E),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white70, size: 22),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(subtitle, style: const TextStyle(color: Colors.white54)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSwitchCard() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color(0xFF1E1E1E),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.dark_mode, color: Colors.white70, size: 22),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thème",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mode sombre activé",
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ],
        ),
        Switch(value: true, onChanged: (_) {}, activeColor: Colors.red),
      ],
    ),
  );
}
