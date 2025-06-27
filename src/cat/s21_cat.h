#ifndef S21_CAT_H
#define S21_CAT_H

#include <ctype.h>
#include <getopt.h>
#include <stdio.h>
#include <string.h>

struct Opt {
  int b;
  int e;
  int v;
  int s;
  int t;
  int n;
};
int parser(int argc, char *argv[], struct Opt *opt);
void work_with_text(int argc, char *argv[], struct Opt *opt);
int format_text(FILE *file, struct Opt *opt);

#endif