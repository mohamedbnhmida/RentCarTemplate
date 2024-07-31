class ChatItem {
  final String avatarUrl;
  final String name;
  final String lastMessage;
  final String date;

  ChatItem({required this.avatarUrl, required this.name, required this.lastMessage, required this.date});
}

List<ChatItem> chatItems = [
  ChatItem(
    avatarUrl: 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
    name: 'John Doe',
    lastMessage: 'Hello, how are you?',
    date: '12:30 PM',
  ),
  ChatItem(
    avatarUrl: 'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
    name: 'Jane Smith',
    lastMessage: 'Are we meeting tomorrow?',
    date: '11:45 AM',
  ),
  ChatItem(
    avatarUrl: 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
    name: 'Sam Wilson',
    lastMessage: 'I sent you the documents.',
    date: '10:00 AM',
  ),
  ChatItem(
    avatarUrl: 'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
    name: 'Michael Brown',
    lastMessage: 'Thanks for your help!',
    date: 'Yesterday',
  ),
  ChatItem(
    avatarUrl: 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
    name: 'Laura White',
    lastMessage: 'See you soon.',
    date: '2 days ago',
  ),
];