import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/bach_model.dart';

class BachDbFunctions {
  static final box = HiveBoxes.batchBox!;
  static Future<void> insert() async {
    List<String> bachs = ["Flutter", "Mern stack", "Syber Sequrity", "Java"];

    for (int i = 0; i < bachs.length; i++) {
      await box.put(i, BatchModel(id: i, batchName: bachs[i]));
    }

    await getAll();
  }

  static Future<List<BatchModel>> getAll() async {
    final list = box.values.toList().cast<BatchModel>();
    print(list);
    return list;
  }
}
