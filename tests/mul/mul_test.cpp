#include "mul.h"
#include <gtest/gtest.h>

TEST(MulTest, Mul) {
  EXPECT_EQ(2, mul(1, 2));
  EXPECT_EQ(3, mul(1, 3));
  EXPECT_EQ(4, mul(2, 2));
  EXPECT_EQ(6, mul(2, 3));
}