class QuizLogic {
  int currentIndex = 0;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  String? selectedAnswer;

  void checkAnswer(String correctAnswer) {
    if (selectedAnswer == correctAnswer) {
      this.correctAnswer++;
    } else {
      wrongAnswer++;
    }
  }

  void nextQuestion(int totalQuestions) {
    if (currentIndex < totalQuestions - 1) {
      currentIndex++;
      selectedAnswer = null;
    }
  }

  void resetQuiz() {
    currentIndex = 0;
    correctAnswer = 0;
    wrongAnswer = 0;
    selectedAnswer = null;
  }
}

