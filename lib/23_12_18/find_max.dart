double findMax(List<double> nums) {
  nums.sort((a, b) => -a.compareTo(b));

  return nums[0];
}
