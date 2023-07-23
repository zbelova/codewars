import 'dart:math' as math;

void runKatas() {
  print(productArray([3, 27, 4, 2]));
}

//TODO
//Array Leaders (Array Series #3)
//An element is leader if it is greater than The Sum all the elements to its right side.
//Given an array/list [] of integers , Find all the LEADERS in the array.
//arrayLeaders ({1, 2, 3, 4, 0}) ==> return {4}

List<int> arrayLeaders(numbers) {
  List<int> result = [];
  for (int i = 0; i < numbers.length; i++) {
    int reduced = i == numbers.length - 1 ? 0 : List.from(numbers.getRange(i + 1, numbers.length)).reduce((v, e) => v + e);
    if (numbers[i] > reduced) {
      result.add(numbers[i]);
    }
  }
  return result;
}

//better
List<int> arrayLeaders2(List<int> numbers) {
  List<int> leaders = [];

  for (int i = 0; i < numbers.length; i++) {
    // current number should be greater than the sum of the following numbers
    if (numbers[i] > numbers.sublist(i + 1).fold(0, (num a, int b) => a + b)) {
      leaders.add(numbers[i]);
    }
  }
  return leaders;
}

//TODO
//How many stairs will Suzuki climb in 20 years?
//20_year_estimate = one_year_total * 20
// stairs = [sunday,monday,tuesday,wednesday,thursday,friday,saturday]
// sunday = [6737, 7244, 5776, 9826, 7057, 9247, 5842, 5484, 6543, 5153, 6832, 8274, 7148, 6152, 5940, 8040, 9174, 7555, 7682, 5252, 8793, 8837, 7320, 8478, 6063, 5751, 9716, 5085, 7315, 7859, 6628, 5425, 6331, 7097, 6249, 8381, 5936, 8496, 6934, 8347, 7036, 6421, 6510, 5821, 8602, 5312, 7836, 8032, 9871, 5990, 6309, 7825]

int stairsIn20(List<List<int>> arr) => arr.expand((p) => p).toList().map((e) => e).toList().reduce((a, b) => a + b) * 20; //нужен ли тут мап и ту лист? не нужен вроде, остался после переноса 20 в конец

//TODO
// Vowel Count
// Return the number (count) of vowels in the given string.
// We will consider a, e, i, o, u as vowels for this Kata (but not y).
// The input string will only consist of lower case letters and/or spaces.

int getCount(String inputStr) {
  List listAll = inputStr.split('');
  var cleared = 0;
  for (var item in listAll) {
    if (['a', 'e', 'i', 'o', 'u'].contains(item)) cleared++;
  }
  return cleared;
}

int getCount2(String str) =>
    new RegExp('[aeiou]')
        .allMatches(str)
        .length;

int getCount3(String inputStr) {
  return inputStr.split('').fold(0, (a, b) => a += 'aeiou'.contains(b) ? 1 : 0);
}

//TODO
//Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contain any char.

bool XO(str) =>
    'x'
        .allMatches(str.toLowerCase())
        .length == 'o'
        .allMatches(str.toLowerCase())
        .length;

//TODO
//Take 2 strings s1 and s2 including only letters from a to z.
//Return a new sorted string, the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.
//a = "xyaabbbccccdefww"
// b = "xxxxyyyyabklmopq"
// longest(a, b) -> "abcdefklmopqwxy"

String longest(String a, String b) {
  var result = (a + b).split('')
    ..sort();
  return result.toSet().join('');
}

String longest2(a, b) =>
    (((a + b).split('').toSet().toList())
      ..sort()).join();

//TODO
//Given an array/list [] of integers , Find The maximum difference between the successive elements in its sorted form.

int maxGap(nums) {
  int gap = 0;
  nums.sort();
  for (int i = 0; i < nums.length - 1; i++) {
    int curGap = (nums[i] - nums[i + 1]).abs();
    gap = curGap > gap ? curGap : gap;
  }
  return gap;
}

int maxGap2(List<int> nums) {
  nums.sort((a, b) => a - b);
  return List.generate(nums.length - 1, (i) => (nums[i] - nums[i + 1]).abs()).reduce(math.max);
}

//TODO
//Given an array/list [] of integers , Construct a product array Of same size Such That prod[i] is equal to The Product of all the elements of Arr[] except Arr[i].

List<int> productArray(List<int> nums) {
  List<int> result = [];
  for (int num in nums) {
    result.add(nums.reduce((value, element) => value * element) ~/ num);
  }
  return result;
}

List productArray2(List<int> nums) {
  final total = nums.reduce((curr, next) => curr * next);
  return nums.map((v) => total / v).toList();
}

//TODO You are given an odd-length array of integers, in which all of them are the same, except for one single number.

int stray(numbers) {
  numbers.sort();
  return numbers[0] == numbers[1] ? numbers.last : numbers.first;
}

//TODO Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
// "abcde" -> 0 # no characters repeats more than once
// "aabbcde" -> 2 # 'a' and 'b'
// "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)

//count number of non-unique characters

int duplicateCount(String text){
  int result = 0;
  List<String> textList = text.toLowerCase().split('');
  List<String> setList= textList.toSet().toList();
  for (var item in setList) {
    if (textList.where((element) => element == item).length > 1) result++;
  }
  return result;
}

int duplicateCount2(String text){
  text = text.toLowerCase();
  var doubles = text.split("").where((c) => text.indexOf(c) < text.lastIndexOf(c));

  return Set.from(doubles).length;
}