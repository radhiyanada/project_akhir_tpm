import 'package:flutter/material.dart';
import 'package:projekakhir/database/shared_preference.dart';
import 'package:projekakhir/login.dart';

class Profil extends StatelessWidget {
  const Profil({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                      top: 10,
                      left: 50,
                      right: 50,
                      child: Center(
                        child: Text(
                          'PROFILE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      right: 50,
                      child: CircleAvatar(
                        radius: size.height / 13,
                        backgroundImage: AssetImage('asset/image/kucing.jpg'),
                      ),
                    ),
                    Positioned(
                        top: 160,
                        left: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: 400,
                                  child: const Text(
                                    'Nama : Radhiya Ahmad Qotrunnada',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
                    Positioned(
                        top: 190,
                        left: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: 400,
                                  child: const Text(
                                    'NIM : 123200137',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
                    Positioned(
                        top: 220,
                        left: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: 400,
                                  child: const Text(
                                    'Kelas : Teknologi Dan Pemrograman Mobile IF-D',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    Positioned(
                        top: 250,
                        left: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: 400,
                                  child: const Text(
                                    'Saran : Berharap tugas dapat diminimalisir',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    Positioned(
                        top: 280,
                        left: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: 400,
                                  child: const Text(
                                    'Kesan : Dosen memberikan materi yang detail dan penjelasannya mudah dimengerti',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 10,
                      right: 50,
                      left: 50,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(22),
                          height: 80,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              SharedPreference().setLogout();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false,
                              );
                            },
                            child: const Text('Logout'),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 44, 44),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}