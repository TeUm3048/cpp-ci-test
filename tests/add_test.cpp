#include "add.h"
#include <gtest/gtest.h>

TEST(AddTest, Add) {
  EXPECT_EQ(2, add(1, 1));
  EXPECT_EQ(3, add(1, 2));
  EXPECT_EQ(4, add(2, 2));
  EXPECT_EQ(5, add(2, 3));
}
