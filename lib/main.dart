import 'dart:html' as html; // Web specific
import 'package:flutter/foundation.dart'; // kIsWeb mate
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BwPortfolioApp());
}

class BwPortfolioApp extends StatelessWidget {
  const BwPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HIREN'S PORTFOLIO",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: const MouseHomePage(),
    );
  }
}

class MouseHomePage extends StatefulWidget {
  const MouseHomePage({super.key});

  @override
  State<MouseHomePage> createState() => _MouseHomePageState();
}

class _MouseHomePageState extends State<MouseHomePage> {
  Offset _mousePos = Offset.zero;

  // Keys for scrolling
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Skill Selection
  int _selectedSkillIndex = 0;

  // Skills Data
  final List<Map<String, String>> mySkills = [
    {
      "name": "Flutter",
      "detail": "Expert in building high-performance, cross-platform mobile and web applications using Flutter framework with complex UI animations."
    },
    {
      "name": "Dart",
      "detail": "Deep understanding of Dart language concepts including asynchronous programming, null safety, and object-oriented principles."
    },
    {
      "name": "Firebase",
      "detail": "Proficient in Firestore, Realtime Database, Cloud Functions, Authentication, and Push Notifications setup."
    },
    {
      "name": "REST API",
      "detail": "Experienced in integrating complex RESTful APIs, handling JSON serialization, and managing error states efficiently."
    },
    {
      "name": "GetX / Bloc",
      "detail": "Strong command over state management solutions like GetX for simple apps and BLoC/Cubit for scalable enterprise applications."
    },
    {
      "name": "Git & GitHub",
      "detail": "Proficient in version control, branching strategies, pull requests, and resolving merge conflicts in team environments."
    },
    {
      "name": "Google Maps",
      "detail": "Experience integrating Google Maps API, custom markers, polyline tracking, and location-based services."
    },
    {
      "name": "Payment Gateways",
      "detail": "Implemented secure payment processing using Stripe, Razorpay, and other local payment gateway providers."
    },
  ];

  // Projects Data
  final List<Map<String, String>> myProjects = [
    {
      "number": "01",
      "title": "E-Commerce App",
      "desc": "A complete shopping app with payment gateway integration.",
      "image": "https://images.unsplash.com/photo-1592503254549-d83d24a4dfab?q=80&w=1032&auto=format&fit=crop",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/app-link",
      "android": "https://play.google.com/store/apps",
    },
    {
      "number": "02",
      "title": "Wavee Ai",
      "desc": "Wavee AI is a secure, AI-powered social and service platform.",
      "image": "https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=800&q=80",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/in/app/wavee-ai/id6747960891",
      "android": "https://play.google.com/store/apps/details?id=com.wavee.community&hl=en_IN",
    },
    {
      "number": "03",
      "title": "Wavee Concierge",
      "desc": "Empowers your front desk to streamline daily operations.",
      "image": "https://cdn.prod.website-files.com/68a80407f668ec1af2d50c35/68b750355ce12b54500af5d9_shutterstock_2441452587.jpg",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/app-link",
      "android": "https://play.google.com/store/apps/details?id=com.pets.wavee&hl=en_IN",
    },
    {
      "number": "04",
      "title": "Wavee Pet",
      "desc": "Wavee Pets is the ultimate platform for pet lovers.",
      "image": "https://cdn.prod.website-files.com/68e7cc1eb18069b17c9cd8e7/68e7e3baf19e226cf4cd117c_Pet-Life.jpg",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/us/app/wavee-pet/id6746203457",
      "android": "https://play.google.com/store/apps/details?id=com.pets.wavee&hl=en_IN",
    },
  ];

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Future<void> openLink(String urlStr) async {
    if (urlStr.isEmpty) return;
    final url = Uri.parse(urlStr);
    if (kIsWeb) {
      html.window.open(url.toString(), "_blank");
    } else {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception("Could not launch $url");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    const showEffects = true;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePos = event.position;
          });
        },
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _mousePos = details.globalPosition;
            });
          },
          onTapDown: (details) {
            setState(() {
              _mousePos = details.globalPosition;
            });
          },
          child: Stack(
            children: [
              // 1. Background Spotlight
              if (showEffects)
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(
                        (_mousePos.dx / width) * 2 - 1,
                        (_mousePos.dy / MediaQuery.of(context).size.height) * 2 - 1,
                      ),
                      radius: 0.8,
                      colors: [Colors.white.withOpacity(0.15), Colors.black],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),

              // 2. Main Layout (Column with Fixed Header)
              Column(
                children: [
                  // --- FIXED HEADER ---
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50, vertical: 20),
                    child: _buildHeader(isMobile),
                  ),

                  // --- SCROLLABLE CONTENT ---
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Column(
                        children: [

                          // CONTENT CONTAINER (Intro, Stats, Skills, Work)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Intro Section
                                Container(
                                  key: _homeKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "HELLO, I AM",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          letterSpacing: 2,
                                          fontSize: isMobile ? 14 : 16,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "HIREN\nCHANDALIYA",
                                        style: TextStyle(
                                          fontSize: isMobile ? 40 : 90,
                                          fontWeight: FontWeight.w900,
                                          height: 0.9,
                                          letterSpacing: -2,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "FLUTTER DEVELOPER",
                                        style: TextStyle(
                                          fontSize: isMobile ? 30 : 70,
                                          fontWeight: FontWeight.w900,
                                          height: 0.9,
                                          letterSpacing: -2,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      Text(
                                        "I create high-performance apps and websites using Flutter.\nCheck out my latest work below.",
                                        style: TextStyle(
                                          fontSize: isMobile ? 16 : 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 80),

                                // Statistics
                                Wrap(
                                  spacing: 40,
                                  runSpacing: 20,
                                  children: [
                                    _buildStatItem("3+", "YEARS EXP."),
                                    _buildStatItem("20+", "PROJECTS DONE"),
                                    _buildStatItem("15+", "HAPPY CLIENTS"),
                                  ],
                                ),

                                const SizedBox(height: 100),

                                // --- SKILLS SECTION ---
                                Container(
                                  key: _skillsKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Divider(color: Colors.white24),
                                      const SizedBox(height: 50),
                                      Text(
                                        "MY EXPERTISE / TECH STACK",
                                        style: TextStyle(
                                          fontSize: isMobile ? 12 : 14,
                                          letterSpacing: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 30),

                                      // Skill Chips
                                      Wrap(
                                        spacing: 15,
                                        runSpacing: 15,
                                        children: List.generate(mySkills.length, (index) {
                                          return _buildInteractiveSkillItem(index);
                                        }),
                                      ),

                                      const SizedBox(height: 30),

                                      // Skill Detail Box
                                      AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 300),
                                        child: Container(
                                          key: ValueKey<int>(_selectedSkillIndex),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(25),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white.withOpacity(0.05),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                mySkills[_selectedSkillIndex]['name']!,
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                mySkills[_selectedSkillIndex]['detail']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white70,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 50),
                                    ],
                                  ),
                                ),

                                // Work Section Title
                                Container(
                                  key: _workKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Divider(color: Colors.white24),
                                      const SizedBox(height: 50),
                                      Text(
                                        "SELECTED WORK / GITHUB REPOS",
                                        style: TextStyle(
                                          fontSize: isMobile ? 12 : 14,
                                          letterSpacing: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                    ],
                                  ),
                                ),

                                // Projects
                                ...myProjects.map((project) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 80),
                                    child: _buildProjectItem(isMobile, project),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),

                          const SizedBox(height: 50),

                          // --- NEW STYLISH FOOTER ---
                          Container(
                            key: _contactKey,
                            width: double.infinity,
                            // Subtle dark grey background to separate from body
                            color: const Color(0xFF0A0A0A),
                            child: Column(
                              children: [
                                // Top Border Line
                                Container(height: 1, color: Colors.white24),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 20 : 50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Have an idea?",
                                        style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "LET'S CONNECT.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: isMobile ? 36 : 64,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                      const SizedBox(height: 40),

                                      // Email Button (Solid White for contrast)
                                      ElevatedButton(
                                        onPressed: () => openLink("mailto:hirenpchandaliya@gmail.com"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 22),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                        ),
                                        child: const Text("hirenpchandaliya@gmail.com", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                      ),

                                      const SizedBox(height: 60),

                                      // Circular Social Icons
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          _buildCircularSocialIcon(Icons.code, "https://github.com/HirenChandaliya"),
                                          const SizedBox(width: 20),
                                          _buildCircularSocialIcon(Icons.link, "https://linkedin.com/"),
                                          const SizedBox(width: 20),
                                          _buildCircularSocialIcon(Icons.alternate_email, "https://twitter.com/"),
                                        ],
                                      ),

                                      const SizedBox(height: 60),
                                      const Divider(color: Colors.white10),
                                      const SizedBox(height: 30),

                                      Text(
                                        "© 2025 Hiren Chandaliya. All Rights Reserved.",
                                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 3. Mouse Pointer (Top Layer)
              if (showEffects)
                Positioned(
                  left: _mousePos.dx - 20,
                  top: _mousePos.dy - 20,
                  child: IgnorePointer(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widgets ---

  // New Circular Social Icon Helper
  Widget _buildCircularSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => openLink(url),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          const Text(
            "MY PORTFOLIO.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navLink("Home", () => _scrollToSection(_homeKey)),
              _navLink("Skills", () => _scrollToSection(_skillsKey)),
              _navLink("Work", () => _scrollToSection(_workKey)),
              _navLink("Contact", () => _scrollToSection(_contactKey)),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "MY PORTFOLIO.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            children: [
              _navLink("Home", () => _scrollToSection(_homeKey)),
              const SizedBox(width: 30),
              _navLink("Skills", () => _scrollToSection(_skillsKey)),
              const SizedBox(width: 30),
              _navLink("Work", () => _scrollToSection(_workKey)),
              const SizedBox(width: 30),
              _navLink("Contact", () => _scrollToSection(_contactKey)),
            ],
          ),
        ],
      );
    }
  }

  Widget _navLink(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveSkillItem(int index) {
    final bool isSelected = _selectedSkillIndex == index;
    final String name = mySkills[index]['name']!;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedSkillIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white24,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.05),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ]
              : [],
        ),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectItem(bool isMobile, Map<String, String> project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: isMobile ? 200 : 400,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            image: DecorationImage(
              image: NetworkImage(project['image']!),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.black45,
                BlendMode.darken,
              ),
            ),
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(isMobile ? 10 : 0),
          ),
          child: Center(
            child: Icon(
              Icons.touch_app,
              color: Colors.white.withOpacity(0.5),
              size: isMobile ? 30 : 50,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildProjectContent(isMobile, project),
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildProjectContent(isMobile, project),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildProjectContent(
      bool isMobile,
      Map<String, String> project,
      ) {
    if (isMobile) {
      return [
        Text(
          project['number']!,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          project['title']!,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          project['desc']!,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 15),
        _buildButtonRow(project),
      ];
    } else {
      return [
        Text(
          project['number']!,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project['title']!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                project['desc']!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildButtonRow(project),
            ],
          ),
        ),
      ];
    }
  }

  Widget _buildButtonRow(Map<String, String> project) {
    return Wrap(
      spacing: 15, // Space between buttons
      runSpacing: 10,
      children: [
        if (project['link']!.isNotEmpty)
          _buildActionButton("Code", Icons.code, project['link']!),
        if (project['android']!.isNotEmpty)
          _buildActionButton("Play Store", Icons.android, project['android']!),
        if (project['ios']!.isNotEmpty)
          _buildActionButton("App Store", Icons.apple, project['ios']!),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, String url) {
    return OutlinedButton.icon(
      onPressed: () => openLink(url),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}