#ifndef S21_GREP_H
#define S21_GREP_H

#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Opt {
  int i;
  int e;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
};

void parser(int argc, char *argv[], struct Opt *opt);
void work_with_text(char *pattern, FILE *file, int argc, char *file_name,
                    struct Opt *opt);
int find_pattern_regex(const char *pattern, const char *word, int flag);
void work_with_arg(int argc, char **argv, struct Opt *opt);
int flag_e(int argc, char *argv[], struct Opt *opt);
void print_text(int argc, char *argv[], char *patterns, struct Opt *opt);
int flag_f_file(char *patterns_file, char *patterns, struct Opt *opt);

#endif