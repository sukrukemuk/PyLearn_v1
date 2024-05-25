import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pylearn_v1/home/homepage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(const YoutubePlayerExample());

class YoutubePlayerExample extends StatefulWidget {
  const YoutubePlayerExample({super.key});

  @override
  State<YoutubePlayerExample> createState() => _YoutubePlayerExampleState();
}

class _YoutubePlayerExampleState extends State<YoutubePlayerExample> {
  final videos = [
    {
      'url':
          "https://www.youtube.com/watch?v=llIQYBIAs9A&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=1",
      'title': "Kurs 1: Python Programlama Nedir?",
      'thumbnail': "https://img.youtube.com/vi/llIQYBIAs9A/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=GuIrekCL7_8&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=3",
      'title': "Kurs 2: Değişkenler ve Operatörler",
      'thumbnail': "https://img.youtube.com/vi/GuIrekCL7_8/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=PAebrWr5WR4&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=4",
      'title': "Kurs 3: Float ve Int Arasındaki Farklar",
      'thumbnail': "https://img.youtube.com/vi/PAebrWr5WR4/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=yisKASiK70U&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=5",
      'title': "Kurs 4: String Veri Tipi ve Özellikleri",
      'thumbnail': "https://img.youtube.com/vi/yisKASiK70U/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=i5WuvTPD200&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=6",
      'title': "Kurs 5: Veri Dönüşümleri ",
      'thumbnail': "https://img.youtube.com/vi/i5WuvTPD200/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=_eGMuHsamlE&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=7",
      'title': "Kurs 6: print('Fonksiyonu Ve Özellikleri') ",
      'thumbnail': "https://img.youtube.com/vi/_eGMuHsamlE/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=8IabpiwCZ2s&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=9",
      'title': "Kurs 7: Yıldızlı Parametreler",
      'thumbnail': "https://img.youtube.com/vi/8IabpiwCZ2s/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=G9RLqNfXstA&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=10",
      'title': "Kurs 8: Liste Veri Tipleri",
      'thumbnail': "https://img.youtube.com/vi/G9RLqNfXstA/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=YxJBwKPBn9Y&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=11",
      'title': "Kurs 9: Tuple Veri Tipleri",
      'thumbnail': "https://img.youtube.com/vi/YxJBwKPBn9Y/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=uG8w1zIhTKo&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=12",
      'title': "Kurs 10: Dictionary Veri Tipleri",
      'thumbnail': "https://img.youtube.com/vi/uG8w1zIhTKo/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=Bp0gmVkTqj8&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=13",
      'title': "Kurs 11: Input() Fonksiyonu",
      'thumbnail': "https://img.youtube.com/vi/Bp0gmVkTqj8/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=Z3MYdA72ajg&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=14",
      'title': "Kurs 12: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/Z3MYdA72ajg/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=X1bsevtYS_c&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=15",
      'title': "Kurs 13: Mantıksal İfadeler",
      'thumbnail': "https://img.youtube.com/vi/X1bsevtYS_c/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=-zHrKqxk0Rc&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=16",
      'title': "Kurs 14: Mantıksal Bağlaçrlar (and | or )",
      'thumbnail': "https://img.youtube.com/vi/-zHrKqxk0Rc/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=QKvxubQJwkc&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=17  ",
      'title': "Kurs 15: If & Else Blokları",
      'thumbnail': "https://img.youtube.com/vi/QKvxubQJwkc/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=osdeqjIseA4&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=18",
      'title': "Kurs 16: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/osdeqjIseA4/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=P3Mhl2yTeBU&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=19",
      'title': "Kurs 17: For Döngüsü",
      'thumbnail': "https://img.youtube.com/vi/P3Mhl2yTeBU/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=8_cK5FjlZao&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=20",
      'title': "Kurs 18: While Döngüsü",
      'thumbnail': "https://img.youtube.com/vi/8_cK5FjlZao/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=wILi3lhdeso&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=21",
      'title': "Kurs 19: Range()",
      'thumbnail': "https://img.youtube.com/vi/wILi3lhdeso/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=fS5rQ6zGLRY&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=22",
      'title': "Kurs 20: Break ve Continue",
      'thumbnail': "https://img.youtube.com/vi/fS5rQ6zGLRY/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=hdQX1dhkNio&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=23",
      'title': "Kurs 21: List Comprehension ",
      'thumbnail': "https://img.youtube.com/vi/hdQX1dhkNio/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=CE1dUDeDias&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=24",
      'title': "Kurs 22: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/CE1dUDeDias/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=LDR2R_h2Qw0&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=25",
      'title': "Kurs 23: Fonksiyonlar",
      'thumbnail': "https://img.youtube.com/vi/LDR2R_h2Qw0/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=940wISdasLM&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=26",
      'title': "Kurs 24: Fonksiyonlar ve Return",
      'thumbnail': "https://img.youtube.com/vi/940wISdasLM/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=Idvj3jTktIc&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=27",
      'title': "Kurs 25: Fonksiyonlar ve Parametre",
      'thumbnail': "https://img.youtube.com/vi/Idvj3jTktIc/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=uKz4gV50lpI&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=29",
      'title': "Kurs 26: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/uKz4gV50lpI/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=71SgX-jy9Iw&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=30",
      'title': "Kurs 27: Modüller",
      'thumbnail': "https://img.youtube.com/vi/71SgX-jy9Iw/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=wJ0YbZdkPyw&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=31",
      'title': "Kurs 28: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/wJ0YbZdkPyw/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=cqe0xQDVGl4&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=32",
      'title': "Kurs 29: Class Yapısı Nedir?",
      'thumbnail': "https://img.youtube.com/vi/cqe0xQDVGl4/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=9gCM4Fe4mSw&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=33",
      'title': "Kurs 30: Basit Şirket Otomasyonu - Class (OOP) Önemi!",
      'thumbnail': "https://img.youtube.com/vi/9gCM4Fe4mSw/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=TG3BGfoBcKI&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=34",
      'title': "Kurs 31: Kalıtım (Inherıtance) Nedir?",
      'thumbnail': "https://img.youtube.com/vi/TG3BGfoBcKI/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=YU1DSQo3FFg&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=35",
      'title': "Kurs 32: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/YU1DSQo3FFg/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=AOsyk9X8XDI&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=36",
      'title': "Kurs 33: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/AOsyk9X8XDI/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=T_b4GPl93as&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=37",
      'title': "Kurs 34: Hata Bulma | Try Except",
      'thumbnail': "https://img.youtube.com/vi/T_b4GPl93as/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=EM_MP_zahKo&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=39",
      'title': "Kurs 35: Dosya İşlemleri",
      'thumbnail': "https://img.youtube.com/vi/EM_MP_zahKo/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=iUjRgYh_4b4&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=40",
      'title': "Kurs 36: Planlama Programı",
      'thumbnail': "https://img.youtube.com/vi/iUjRgYh_4b4/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=L_mc-zmunQc&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=41",
      'title': "Kurs 37: Map() - Yararlı Gömülü Fonksiyon",
      'thumbnail': "https://img.youtube.com/vi/L_mc-zmunQc/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=_LqWQhUD7rs&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=42",
      'title': "Kurs 38: Max(), Min(), Sum()- Yararlı Gömülü Fonksiyon",
      'thumbnail': "https://img.youtube.com/vi/_LqWQhUD7rs/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=G0VyvXJuquM&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=43",
      'title': "Kurs 39: Zip, Enumerate, Filter, All, Any, Len ",
      'thumbnail': "https://img.youtube.com/vi/G0VyvXJuquM/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=zGR4RfUr-_M&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=44",
      'title': "Kurs 40: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/zGR4RfUr-_M/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=w5B31gSToOY&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=45",
      'title': "Kurs 41: STR Sınıfı Fonksiyonları",
      'thumbnail': "https://img.youtube.com/vi/w5B31gSToOY/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=5tqtZPQR2-U&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=46",
      'title': "Kurs 42: Set(Küme) Sınıfı",
      'thumbnail': "https://img.youtube.com/vi/5tqtZPQR2-U/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=I1UqCFohw8Q&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=47",
      'title': "Kurs 43: Veri Tabanı | SQLite",
      'thumbnail': "https://img.youtube.com/vi/I1UqCFohw8Q/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=2Tw7uO13-ww&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=48",
      'title': "Kurs 44: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/2Tw7uO13-ww/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=GBEU5YqNaoI&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=49",
      'title': "Kurs 45: Decorator & MP3 Downloader",
      'thumbnail': "https://img.youtube.com/vi/GBEU5YqNaoI/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=jbQxr_zdPcQ&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=50",
      'title': "Kurs 46: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/jbQxr_zdPcQ/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=bd_bZI_kb1M&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=51",
      'title': "Kurs 47: İteratörler",
      'thumbnail': "https://img.youtube.com/vi/bd_bZI_kb1M/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=4-0tLD_WftM&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=52",
      'title': "Kurs 48: Siz Kodlayın!",
      'thumbnail': "https://img.youtube.com/vi/4-0tLD_WftM/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=5MAhJysVOhU&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=53",
      'title': "Kurs 49: Generator",
      'thumbnail': "https://img.youtube.com/vi/5MAhJysVOhU/0.jpg",
    },
    {
      'url':
          "https://www.youtube.com/watch?v=dD2nOeUvwIQ&list=PLK6Whnd55IH5i1klkNSBDasIaO77l-Bm9&index=54",
      'title': "Kurs 50: SON...",
      'thumbnail': "https://img.youtube.com/vi/dD2nOeUvwIQ/0.jpg",
    },
  ];

  late List<YoutubePlayerController?> _controllers;
  late List<bool> _isVideoLoaded;

  @override
  void initState() {
    _controllers = List.generate(videos.length, (_) => null);
    _isVideoLoaded = List.generate(videos.length, (_) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 27, 27),
      appBar: !_isVideoInFullScreen()
          ? AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: const Text(
                'Kurslar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              shadowColor: Colors.white,
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      videos[index]['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      _openVideoPlayer(index);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            videos[index]['thumbnail']!,
                            fit: BoxFit.cover,
                          ),
                          const Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isVideoInFullScreen() {
    for (final controller in _controllers) {
      if (controller?.value.isFullScreen ?? false) {
        return true;
      }
    }
    return false;
  }

  void _openVideoPlayer(int index) {
    if (!_isVideoLoaded[index]) {
      final videoID = YoutubePlayer.convertUrlToId(videos[index]['url']!);
      _controllers[index] = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          controlsVisibleAtStart: true,
        ),
      );
      _isVideoLoaded[index] = true;
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 33, 33),
        appBar: !_isVideoInFullScreen()
            ? AppBar(
                title: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: SvgPicture.asset(
                            "assets/icons/logo.svg",
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color.fromARGB(255, 34, 33, 33)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              )
            : null,
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: () async {
            for (int i = 0; i < _controllers.length; i++) {
              if (_controllers[i]?.value.isFullScreen ?? false) {
                _controllers[i]?.toggleFullScreenMode();
                return false;
              }
            }
            return true;
          },
          child: Center(
            child: _controllers[index] != null
                ? YoutubePlayer(
                    controller: _controllers[index]!,
                    showVideoProgressIndicator: true,
                    onReady: () => debugPrint('Ready'),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    ));
  }
}
