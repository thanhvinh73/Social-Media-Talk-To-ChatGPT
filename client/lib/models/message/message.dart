class Message {
  String? id;
  String? message;
  bool isSentByMe;
  bool isGenerating;
  bool isDone;
  Message(
      {this.id,
      this.message,
      required this.isSentByMe,
      required this.isGenerating,
      required this.isDone});

  Message copyWith(
      {String? message, bool? isSentByMe, bool? isGenerating, bool? isDone}) {
    Message messageObj = Message(
        id: id,
        message: this.message,
        isSentByMe: this.isSentByMe,
        isGenerating: this.isGenerating,
        isDone: this.isDone);
    messageObj.message = message ?? this.message;
    messageObj.isSentByMe = isSentByMe ?? this.isSentByMe;
    messageObj.isGenerating = isGenerating ?? this.isGenerating;
    messageObj.isDone = isDone ?? this.isDone;
    return messageObj;
  }

  @override
  String toString() {
    return "id: $id - message: $message - isSentByMe: $isSentByMe - isGenerating: $isGenerating - isDone: $isDone";
  }
}
