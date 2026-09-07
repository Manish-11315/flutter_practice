abstract class UserblocEvents {}

class loadsingleuser_event extends UserblocEvents{
  final int id;
  loadsingleuser_event({required this.id});
}

class getallusersdata_event extends UserblocEvents{}

class initialuserdata_event extends UserblocEvents{}

class getdata_list_event extends UserblocEvents{}