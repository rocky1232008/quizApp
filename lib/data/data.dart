class Data{
  var questions = ['why are quizzes quizzes?', 'Why are you answering these strange questions?', 'Why does anything exist?', 'hello there','why you still here', 'ok now i think you got enough', 'seriosly', 'lol','ok bye'];
  var answers = ['because', 'im bored', 'big explosion', 'hi', 'im still bored', 'no', 'lol', 'lol', 'bye'];

  var index = 0;

  bool check({answer, index}){
    if(answer == answers[index]){
      return true;
    }else{
      return false;
    }
  }

  String nextQuestion({index}){
    return questions[index + 1];
  }
}