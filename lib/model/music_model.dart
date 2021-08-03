class Song {
  Song(
      {required this.title,
      required this.singer,
      required this.url,
      required this.coverUrl});
  String title, singer, url, coverUrl;
}

List<Song> songs = [
  Song(
    title: "Ana Shibh Nsetk",
    singer: "Elisa",
    url:
        "https://serv10.6arbyat.net/music/lebnan/elissa/sahbet_raey/Ana_Chebh_Nsitak_Melody4Arab.Com.mp3",
    coverUrl: "https://serv10.6arbyat.net/images/group/elissa.jpg",
  ),
  Song(
    title: "Taabet Menk",
    singer: "Elisa",
    url:
        "https://serv10.6arbyat.net/music/lebnan/elissa/asaad_wahda/Tabt_Mnek_melody4arab.com.mp3",
    coverUrl: "https://serv10.6arbyat.net/images/group/elissa.jpg",
  ),
  Song(
    title: "Hylef W Ylef",
    singer: "Elisa",
    url:
        "https://serv10.6arbyat.net/music/lebnan/elissa/asaad_wahda/Hylf_Wylf_melody4arab.com.mp3",
    coverUrl: "https://serv10.6arbyat.net/images/group/elissa.jpg",
  ),
  Song(
    title: "Dary ya Alby",
    singer: "Hamza Namera",
    url:
        "https://serv10.6arbyat.net/music/egypt/hamza_namira/hateer_min_tany/Dari_Ya_Alby_Melody4Arab.Com.mp3",
    coverUrl: "https://serv10.6arbyat.net/images/group/Hamza-Namira.jpg",
  ),
  Song(
      title: "Aysha Ala ely Fat",
      singer: "Asala",
      url:
          "https://serv10.6arbyat.net/music/syria/asalah_/60_deaea_hayat/Aaysha_Aaly_Fat_Melody4Arab.Com.mp3",
      coverUrl:
          "https://serv10.6arbyat.net/music/syria/asalah_/60_deaea_hayat/60-De2e2a-Hayah.jpg"),
];
