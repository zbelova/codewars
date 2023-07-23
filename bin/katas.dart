import 'dart:math' as math;

void runKatas() {
  var result = maxGap2 ([13,10,5,2,9]);
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

int stairsIn20(List<List<int>> arr) => arr.expand((p) => p).toList().map((e) => e).toList().reduce((a, b) => a + b) * 20;

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
