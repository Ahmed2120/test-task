import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/model/drug.dart';
import 'package:test_task/services/drug_service.dart';
import 'package:test_task/services/uername_service.dart';
import 'package:test_task/widgets/greet_message.dart';

void main()async{

  test('check if greet return Good Morning', () {
    final result = GreetMessage.greeting;
    expect(result, 'Good Morning');
  });

  test('check if greet return Good Afternoon', () {
    final result = GreetMessage.greeting;
    expect(result, 'Good Afternoon');
  });

  test('check if greet return Good Evening', () {
    final result = GreetMessage.greeting;
    expect(result, 'Good Evening');
  });

  test('check if greet return Good Night', () {
    final result = GreetMessage.greeting;
    expect(result, 'Good Night');
  });

  test('check if there isn\'t username', () async{
    final result = await Username.getUserNameFrommDB();
    expect(result, null);
  });

  test('check if there is username', () async{
    final result = await Username.getUserNameFrommDB();
    expect(result, 'ahmed202ashraf202@gmail.com');
  });

  test('check if mock api work', () async{
    final result = await DrugService.getDrugs();
    expect(result, [{"name": "Congestal", "dose": "20ml", "strength": "100 mg"}, {"name": "panadol", "dose": "10ml", "strength": "250 mg"}, {"name": "Amoxicillin", "dose": "10ml", "strength": "200 mg"}]);
  });
}