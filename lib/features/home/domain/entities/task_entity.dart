
class TaskEntity {

  final int id;
  final String tittle;
  final String description;
  final bool isDone;

   const TaskEntity({
      required this.id, //ver si se borra esto pero puede ser para una eliminacion adecuada
      required this.tittle,
      this.description = '',
      this.isDone=false,
    });


}