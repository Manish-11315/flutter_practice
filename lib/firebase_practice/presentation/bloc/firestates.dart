abstract class fireStates{}

class loadingFireState extends fireStates{}

class sucessFireState extends fireStates{

}

class errorFireState extends fireStates{
  final String errormsg;
  errorFireState({required this.errormsg});
}