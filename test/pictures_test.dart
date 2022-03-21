import 'package:test/test.dart';
import 'package:wastegram/pictures.dart';
import 'package:intl/intl.dart';

void main() {
  test("pictures class has correct values passed to it", () {
    const num = 19;
    const file = '';

    final pic = Pictures(numberOfItems: num, picture: file);
    expect(pic.numberOfItems, num);
    expect(pic.picture, file);
  });

  test("pictures.getDate() return formatted correctly current date", () {
    const num = 19;
    const file = '';
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    final String formatted = formatter.format(now);

    final pic = Pictures(numberOfItems: num, picture: file);
    expect(pic.getDate(), formatted);
  });
}
