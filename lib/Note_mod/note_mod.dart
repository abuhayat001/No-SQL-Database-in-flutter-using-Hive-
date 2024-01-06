
import 'package:hive/hive.dart';
part 'note_mod.g.dart';
@HiveType(typeId: 0)
class NoteMo {
  @HiveField(0)
  String ID ;
  @HiveField(1)
  String Name ;
  @HiveField(2)
  String DepartMent ;
  NoteMo(this.ID, this.Name, this.DepartMent);
}