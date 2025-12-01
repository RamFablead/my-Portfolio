import 'dart:html' as html; // Web specific
import 'package:flutter/foundation.dart';
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
      title: "RAM MER'S PORTFOLIO",

      // ************ 🔥 NEW ORANGE DARK THEME 🔥 ************
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        primaryColor: const Color(0xFFFF6A00),

        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF6A00),
          secondary: Color(0xFFFF6A00),
          surface: Color(0xFF1A1A1A),
        ),

        textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFFF6A00), width: 1.5),
            foregroundColor: const Color(0xFFFF6A00),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6A00),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
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

  // Scroll Keys
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  int _selectedSkillIndex = 0;
  bool _showAllProjects = false;

  // ************** DATA (UNCHANGED AS REQUESTED) **************
  final List<Map<String, String>> myExperience = [
    {
      "year": "2024- Present",
      "role": "Senior Mobile App Developer",
      "company": "Fablead Developer Technolab",
      "desc":
      "Developed 10+ mobile applications for startups, focusing on UI/UX and Firebase integration.",
    },
    {
      "year": "2023- 2024",
      "role": "Junior Mobile App Developer",
      "company": "Fablead Developer Technolab",
      "desc":
      "Developed 10+ mobile applications for startups, focusing on UI/UX and Firebase integration.",
    },
    {
      "year": "2022 - 2023",
      "role": "Training",
      "company": "Kanron Infotech",
      "desc":
      "Started journey with Flutter, worked on bug fixing and API integration.",
    },
  ];

  // Skills Data
  final List<Map<String, String>> mySkills = [
    {
      "name": "Flutter",
      "detail":
      "Expert in building high-performance, cross-platform mobile and web applications using Flutter framework.",
    },
    {
      "name": "Dart",
      "detail":
      "Deep understanding of Dart language concepts including asynchronous programming and null safety.",
    },
    {
      "name": "Firebase",
      "detail":
      "Proficient in Firestore, Realtime Database, Cloud Functions, and Authentication setup.",
    },
    {
      "name": "REST API",
      "detail":
      "Experienced in integrating complex RESTful APIs and handling JSON serialization.",
    },
    {
      "name": "GetX / Provider",
      "detail":
      "Strong command over state management solutions like GetX and Provider for scalable apps.",
    },
    {
      "name": "Git & GitHub",
      "detail":
      "Proficient in version control, branching strategies, and pull requests.",
    },
  ];

  // Services Data
  final List<Map<String, dynamic>> myServices = [
    {
      "title": "Mobile App Dev",
      "icon": Icons.phone_android,
      "desc": "Building high-quality iOS & Android apps.",
    },
    {
      "title": "Web Development",
      "icon": Icons.web,
      "desc": "Responsive web applications using Flutter Web.",
    },
    {
      "title": "UI/UX Design",
      "icon": Icons.design_services,
      "desc": "Converting Figma designs into pixel-perfect code.",
    },
    {
      "title": "Backend Integration",
      "icon": Icons.cloud_sync,
      "desc": "Seamless integration with Firebase & APIs.",
    },
  ];

  // Projects Data

  final List<Map<String, String>> myProjects = [
    {
      "number": "01",
      "title": "Wavee Ai",
      "desc": "Wavee AI is a secure, AI-powered social and service platform.",
      "image":
      "https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=800&q=80%22",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/in/app/wavee-ai/id6747960891",
      "android":
      "https://play.google.com/store/apps/details?id=com.wavee.community&hl=en_IN",
    },
    {
      "number": "02",
      "title": "Wavee Concierge",
      "desc": "Empowers your front desk to streamline daily operations.",
      "image":
      "https://cdn.prod.website-files.com/68a80407f668ec1af2d50c35/68b750355ce12b54500af5d9_shutterstock_2441452587.jpg%22",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/app-link",
      "android":
      "https://play.google.com/store/apps/details?id=com.pets.wavee&hl=en_IN",
    },
    {
      "number": "03",
      "title": "CRM App",
      "desc": "Custom CRM solution for managing client relationships.",
      "image":
      "https://blog-cdn.quarkly.io/2023/01/Best-CRM-Tools-for-Small-Businesses.png",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "https://apps.apple.com/app-link",
      "android": "https://play.google.com/store/apps",
    },
    {
      "number": "04",
      "title": "Fitness Tracker",
      "desc": "A workout tracking app with diet plans and progress charts.",
      "image":
      "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=800&q=80%22",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "05",
      "title": "Grubb Food & Dine-in",
      "desc":
      "Gruubb – Great taste, fresh meals, and smooth dining every time.",
      "image": "https://grubb.co.in/img/all_vendor.png",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "06",
      "title": "Grubb Merchant",
      "desc":
      "Track orders in real-time, analyze sales like a pro, all from the palm of your hand. Optimise menus, boost deliveries, and watch your profits soar.Grubb Merchant - Take control, deliver success",
      "image":
      "https://play-lh.googleusercontent.com/04YSnGouyh6iOHnBWiFPkZ9bkBej08sVbCxTux6GBbylWbNI3V1oalWOA0BbsljQ4dFb=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "07",
      "title": "Grubb Bolt(Driver)",
      "desc":
      "Grubb Bolt is your ultimate companion for managing food deliveries on the go. Designed specifically for delivery agents, this powerful app provides you with everything you need to streamline your tasks, maximize efficiency, and increase your earnings—all from the convenience of your smartphone.",
      "image":
      "https://play-lh.googleusercontent.com/19juLlvwjlmzotcCoIgnkXjjMCOVR1mQ9xeJSURlcnl12W-2IgtK0SG-bV2vvSXqdZs=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "08",
      "title": "Localwala App",
      "desc":
      "With the Localwala App, customers can easily shop from nearby stores and discounts available on the Localwala App.",
      "image":
      "https://play-lh.googleusercontent.com/GJ28fWoOIvVq5CRu-d9PmptoJy1FvdPpkHAh3XJdHlxI7tXH4RkbIZZMneyuaXC3Yg=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "09",
      "title": "Udibaba",
      "desc":
      "Welcome to Udibaba, your one-stop platform to buy fresh and high-quality fruits directly from sellers across the country. Whether you're craving seasonal fruits or need a variety of fresh produce, Udibaba ensures that you can easily browse through a wide selection of fruit vendors near you. With our user-friendly interface, customers can:Explore a wide variety of fresh fruits, including local and exotic options.Place orders from multiple sellers in just a few taps.Enjoy safe and secure payment options, with a range of payment methods available.",
      "image":
      "https://play-lh.googleusercontent.com/38JAG8P79PX9Y2sPXg5ZsjXagq4p1b3vIstBpbzUvSzRbl_Bd4NShaX4lnymmlFJcg=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "10",
      "title": "Udibaba Store",
      "desc":
      "dibaba Store is the perfect platform for sellers to showcase their fresh fruits and expand their reach to customers across the country. This app is designed to make it easier for fruit vendors to manage their inventory, track orders, and grow their business.",
      "image":
      "https://play-lh.googleusercontent.com/38JAG8P79PX9Y2sPXg5ZsjXagq4p1b3vIstBpbzUvSzRbl_Bd4NShaX4lnymmlFJcg=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
    {
      "number": "11",
      "title": "TEEESSENTIALS",
      "desc":
      "Casa App is a order booking app which is used by its internal users and distributors. Users will be able to see entire catalogue of products and book orders on the app. The advantage of the application is it has up to date stock values which a user can see while booking an order.",
      "image":
      "https://play-lh.googleusercontent.com/WcknI1kXuIAUfGmyeDsdG6YVs9IwklQ9cZA3Mb877Ee0hiTlN1yiNvBV8YLInCYwQyo=w240-h480-rw",
      "link": "https://github.com/HirenChandaliya/gyan.git",
      "ios": "",
      "android": "",
    },
  ];

  // ************** SCROLL + LINK OPEN LOGIC **************
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  Future<void> openLink(String urlStr) async {
    if (urlStr.isEmpty) return;
    final url = Uri.parse(urlStr);

    if (kIsWeb) {
      html.window.open(url.toString(), "_blank");
    } else {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    final showProjects = _showAllProjects ? myProjects : myProjects.take(4).toList();

    return Scaffold(
      body: MouseRegion(
        onHover: (event) => setState(() => _mousePos = event.position),
        child: Stack(
          children: [
            // ******** Background Glow Cursor ********
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.orange.withOpacity(0.08),
                      Colors.black,
                    ],
                    radius: 1,
                    center: Alignment(
                      (_mousePos.dx / width) * 2 - 1,
                      (_mousePos.dy / MediaQuery.of(context).size.height) * 2 - 1,
                    ),
                  ),
                ),
              ),
            ),

            // ******** Main Layout ********
            Column(
              children: [
                _buildHeader(isMobile),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        _buildIntro(isMobile),
                        const SizedBox(height: 80),
                        _buildStats(),
                        const SizedBox(height: 80),
                        _buildSkills(isMobile),
                        const SizedBox(height: 80),
                        _buildServices(isMobile),
                        const SizedBox(height: 80),
                        _buildExperience(),
                        const SizedBox(height: 80),
                        _buildProjects(showProjects, isMobile),
                        const SizedBox(height: 80),
                        _buildFooter(isMobile),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // ******** Orange Custom Cursor ********
            Positioned(
              left: _mousePos.dx - 15,
              top: _mousePos.dy - 15,
              child: IgnorePointer(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ******** Widgets ********

  Widget _buildHeader(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50, vertical: 20),
      color: Colors.black.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("MY PORTFOLIO", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange)),
          if (!isMobile)
            Row(
              children: [
                _navLink("Home", () => _scrollToSection(_homeKey)),
                _navLink("Skills", () => _scrollToSection(_skillsKey)),
                _navLink("Services", () => _scrollToSection(_servicesKey)),
                _navLink("Experience", () => _scrollToSection(_experienceKey)),
                _navLink("Work", () => _scrollToSection(_workKey)),
                _navLink("Contact", () => _scrollToSection(_contactKey)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navLink(String text, VoidCallback onTap) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(text, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
    ),
  );

  Widget _buildIntro(bool isMobile) {
    return Container(
      key: _homeKey,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("HELLO, I AM", style: TextStyle(color: Colors.orange, letterSpacing: 3)),
          const SizedBox(height: 10),
          Text(
            "RAM\nMER",
            style: TextStyle(fontSize: isMobile ? 45 : 100, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(fontSize: isMobile ? 35 : 70, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 30),
          Text(
            "I create high-performance mobile & web applications.\nScroll to explore my work.",
            style: TextStyle(color: Colors.white70, fontSize: isMobile ? 16 : 20),
          )
        ],
      ),
    );
  }

  Widget _buildStats() => Wrap(
    spacing: 50,
    runSpacing: 20,
    children: [
      _stat("2.8+", "Years Exp."),
      _stat("15+", "Projects"),
      _stat("15+", "Clients"),
    ],
  );

  Widget _stat(String count, String label) => Column(
    children: [
      Text(count, style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.orange)),
      Text(label, style: const TextStyle(color: Colors.white70)),
    ],
  );

  Widget _buildSkills(bool isMobile) {
    return Container(
      key: _skillsKey,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SKILLS", style: TextStyle(color: Colors.orange, fontSize: 16, letterSpacing: 2)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            children: List.generate(mySkills.length, (i) {
              bool selected = i == _selectedSkillIndex;
              return InkWell(
                onTap: () => setState(() => _selectedSkillIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: selected ? Colors.orange : Colors.transparent,
                    border: Border.all(color: selected ? Colors.orange : Colors.white24),
                  ),
                  child: Text(
                    mySkills[i]["name"]!,
                    style: TextStyle(color: selected ? Colors.black : Colors.white),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
          Text(mySkills[_selectedSkillIndex]["detail"]!, style: const TextStyle(color: Colors.white70, fontSize: 18))
        ],
      ),
    );
  }

  Widget _buildServices(bool isMobile) {
    return Container(
      key: _servicesKey,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("WHAT I OFFER", style: TextStyle(color: Colors.orange, letterSpacing: 2)),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: myServices.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              childAspectRatio: isMobile ? 1.3 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, index) {
              return ServiceCard(
                title: myServices[index]['title'],
                desc: myServices[index]['desc'],
                icon: myServices[index]['icon'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperience() {
    return Container(
      key: _experienceKey,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("MY EXPERIENCE", style: TextStyle(color: Colors.orange, letterSpacing: 2)),
          const SizedBox(height: 30),
          ...myExperience.map(
                (exp) => ExperienceCard(
              year: exp['year']!,
              role: exp['role']!,
              company: exp['company']!,
              desc: exp['desc']!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjects(List list, bool isMobile) {
    return Container(
      key: _workKey,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SELECTED PROJECTS", style: TextStyle(color: Colors.orange, letterSpacing: 2)),
          const SizedBox(height: 40),
          ...list.map((project) => Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: _buildProjectItem(isMobile, project),
          )),
          Center(
            child: OutlinedButton(
              onPressed: () => setState(() => _showAllProjects = !_showAllProjects),
              child: Text(_showAllProjects ? "SHOW LESS" : "VIEW ALL"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjectItem(bool isMobile, Map<String, String> project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: isMobile ? 200 : 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange),
            image: DecorationImage(image: NetworkImage(project['image']!), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        Text(project['number']!, style: const TextStyle(color: Colors.orange)),
        Text(project['title']!, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(project['desc']!, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          children: [
            if (project['android']!.isNotEmpty)
              _buildActionButton("Play Store", Icons.android, project['android']!),
            if (project['ios']!.isNotEmpty)
              _buildActionButton("App Store", Icons.apple, project['ios']!),
          ],
        )
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, String url) {
    return OutlinedButton.icon(
      icon: Icon(icon, size: 18),
      label: Text(label),
      onPressed: () => openLink(url),
    );
  }

  Widget _buildFooter(bool isMobile) {
    return Container(
      key: _contactKey,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 30 : 100),
      color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          const Text("Have an idea?", style: TextStyle(color: Colors.white60)),
          const SizedBox(height: 10),
          const Text("LET'S CONNECT!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.orange)),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => openLink("mailto:rammer6424@gmail.com"),
            child: const Text("📩  Email Me"),
          ),
          const SizedBox(height: 40),
          const Text("© 2025 RAM MER", style: TextStyle(color: Colors.white30)),
        ],
      ),
    );
  }
}

// ******** Custom Animated Widgets ********

class ServiceCard extends StatefulWidget {
  final String title;
  final String desc;
  final IconData icon;

  const ServiceCard({super.key, required this.title, required this.desc, required this.icon});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: isHovered ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.orange.withOpacity(isHovered ? 1 : 0.4)),
          boxShadow: isHovered
              ? [
            BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 20, spreadRadius: 4),
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, size: 40, color: isHovered ? Colors.black : Colors.orange),
            const SizedBox(height: 20),
            Text(widget.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isHovered ? Colors.black : Colors.white)),
            const SizedBox(height: 10),
            Text(widget.desc, style: TextStyle(color: isHovered ? Colors.black87 : Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final String year;
  final String role;
  final String company;
  final String desc;

  const ExperienceCard({
    super.key,
    required this.year,
    required this.role,
    required this.company,
    required this.desc,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: isHovered ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.orange),
          boxShadow: isHovered
              ? [
            BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 20, spreadRadius: 5)
          ]
              : [],
        ),
        child: Row(
          children: [
            Text(widget.year,
                style: TextStyle(color: isHovered ? Colors.black : Colors.orange, fontWeight: FontWeight.bold)),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.role,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: isHovered ? Colors.black : Colors.white)),
                  const SizedBox(height: 5),
                  Text(widget.company, style: TextStyle(color: isHovered ? Colors.black87 : Colors.white54)),
                  const SizedBox(height: 10),
                  Text(widget.desc, style: TextStyle(color: isHovered ? Colors.black87 : Colors.white60)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
