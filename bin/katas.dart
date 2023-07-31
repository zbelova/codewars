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

int stairsIn20(List<List<int>> arr) =>
    arr.expand((p) => p).toList().map((e) => e).toList().reduce((a, b) => a + b) * 20; //нужен ли тут мап и ту лист? не нужен вроде, остался после переноса 20 в конец

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

int getCount2(String str) => new RegExp('[aeiou]').allMatches(str).length;

int getCount3(String inputStr) {
  return inputStr.split('').fold(0, (a, b) => a += 'aeiou'.contains(b) ? 1 : 0);
}

//TODO
//Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contain any char.

bool XO(str) => 'x'.allMatches(str.toLowerCase()).length == 'o'.allMatches(str.toLowerCase()).length;

//TODO
//Take 2 strings s1 and s2 including only letters from a to z.
//Return a new sorted string, the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.
//a = "xyaabbbccccdefww"
// b = "xxxxyyyyabklmopq"
// longest(a, b) -> "abcdefklmopqwxy"

String longest(String a, String b) {
  var result = (a + b).split('')..sort();
  return result.toSet().join('');
}

String longest2(a, b) => (((a + b).split('').toSet().toList())..sort()).join();

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

int duplicateCount(String text) {
  int result = 0;
  List<String> textList = text.toLowerCase().split('');
  List<String> setList = textList.toSet().toList();
  for (var item in setList) {
    if (textList.where((element) => element == item).length > 1) result++;
  }
  return result;
}

int duplicateCount2(String text) {
  text = text.toLowerCase();
  var doubles = text.split("").where((c) => text.indexOf(c) < text.lastIndexOf(c));

  return Set.from(doubles).length;
}

//TODO The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.
//
// Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.
String rgb(int r, int g, int b) {
  String result = '';
  List<int> rgbList = [r, g, b];
  for (var item in rgbList) {
    if (item < 0) item = 0;
    if (item > 255) item = 255;
    result += item.toRadixString(16).padLeft(2, '0').toUpperCase();
  }
  return result;
}

String rgb2(int r, int g, int b) {
  return [r, g, b].map((e) => e.clamp(0, 255).toInt().toRadixString(16).padLeft(2, '0')).join().toUpperCase();
}

//TODO The drawing shows 6 squares the sides of which have a length of 1, 1, 2, 3, 5, 8. It's easy to see that the sum of the perimeters of these squares is : 4 * (1 + 1 + 2 + 3 + 5 + 8) = 4 * 20 = 80
//
// Could you give the sum of the perimeters of all the squares in a rectangle when there are n + 1 squares disposed in the same manner as in the drawing:

BigInt perimeter(int m) {
  BigInt result = BigInt.zero;
  List<BigInt> fibanache = [BigInt.one, BigInt.one];
  for (int i = 2; i <= m; i++) {
    fibanache.add(fibanache[i - 1] + fibanache[i - 2]);
  }
  for (var item in fibanache) {
    result += item;
  }
  return result * BigInt.from(4);
}

BigInt perimeter2(int m) {
  var a = BigInt.zero;
  var b = BigInt.one;
  var sum = BigInt.one;

  for (var i = 0; i < m; i++) {
    final v = a + b;
    a = b;
    b = v;
    sum += v;
  }

  return sum * BigInt.from(4);
}

//TODO If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
// Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).
//
// Note: If the number is a multiple of both 3 and 5, only count it once.

int solution(int n) {
  List numbers = [];
  for (int i = 1; i < n; i++) {
    if (i % 3 == 0 && !numbers.contains(i)) {
      numbers.add(i);
    }
    if (i % 5 == 0 && !numbers.contains(i)) {
      numbers.add(i);
    }
  }
  return numbers.fold(0, (num p, v) => p + v) as int;
}

int solution2(int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) sum += i % 3 == 0 || i % 5 == 0 ? i : 0;
  return sum;
}

//TODO Write a function that accepts an array of 10 integers (between 0 and 9), that returns a string of those numbers in the form of a phone number.
//createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) // => returns "(123) 456-7890"

String createPhoneNumber(List numbers) => '(${numbers[0]}${numbers[1]}${numbers[2]}) ${numbers[3]}${numbers[4]}${numbers[5]}-${numbers[6]}${numbers[7]}${numbers[8]}${numbers[9]}';

String createPhoneNumber2(List numbers) {
  var n = numbers.join('');
  return '(${n.substring(0, 3)}) ${n.substring(3, 6)}-${n.substring(6)}';
}

String createPhoneNumber3(List numbers) {
  var format = "(xxx) xxx-xxxx";
  for (var i = 0; i < numbers.length; i++) {
    format = format.replaceFirst('x', numbers[i].toString());
  }

  return format;
}

//TODO Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata).
// Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

String spinWords(String str) {
  return str.split(' ').map((v) => v.length >= 5 ? v.split('').reversed.join() : v).toList().join(' ');
}
