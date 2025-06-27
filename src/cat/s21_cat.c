#include "s21_cat.h"

int main(int argc, char *argv[]) {
  struct Opt opt;
  memset(&opt, 0, sizeof(opt));
  if (parser(argc, argv, &opt)) {
    work_with_text(argc, argv, &opt);
  }
  return 0;
}

int parser(int argc, char *argv[], struct Opt *opt) {
  int rez = 0;
  int error = 1;
  const struct option long_options[] = {
      {"number-nonblank", no_argument, &opt->b, 1},
      {"number", no_argument, &opt->n, 1},
      {"squeeze-blank", no_argument, &opt->s, 1},
      {NULL, 0, NULL, 0}};
  while ((rez = getopt_long(argc, argv, "be::Enst::Tv", long_options, NULL)) !=
         -1) {
    switch (rez) {
      case 'b':
        opt->b = 1;
        break;
      case 'e':
        opt->e = 1;
        opt->v = 1;
        break;
      case 'E':
        opt->e = 1;
        break;
      case 'n':
        opt->n = 1;
        break;
      case 's':
        opt->s = 1;
        break;
      case 't':
        opt->t = 1;
        opt->v = 1;
        break;
      case 'T':
        opt->t = 1;
        break;
      case 'v':
        opt->v = 1;
        break;
      case '?':
        error = 0;
        break;
    }
  }
  return error;
}

void work_with_text(int argc, char *argv[], struct Opt *opt) {
  FILE *work = 0;
  int flag = 0;
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-') {
      flag = 1;
    } else {
      flag = 0;
      break;
    }
  }
  if (flag || argc == 1) {
    work = stdin;
    format_text(work, opt);
  } else {
    if (optind < argc) {
      for (int i = optind; i < argc; i++) {
        work = fopen(argv[i], "r");
        if (work == NULL) {
          perror(argv[i]);
          continue;
        }
        format_text(work, opt);
      }
      if (work != NULL) {
        fclose(work);
      }
    }
  }
}

int format_text(FILE *file, struct Opt *opt) {
  int f = 0;
  int flag = '\n';
  int flag_b = 0;
  int flag_b_1 = '\n';
  int count_b = 1;
  int count = 1;
  int cn = 0;
  int sym_numbers = 1;
  while ((f = fgetc(file)) != EOF) {
    if (opt->s && f == '\n' && flag_b_1 == '\n') {
      cn++;
      if (cn > 1) {
        continue;
      }
    }
    if (opt->v && f < 32 && f != 9 && f != 10) {
      printf("^");
      f += 64;
    } else if (opt->v && f == 127) {
      printf("^");
      f -= 64;
    } else if (opt->v && f > 127 && f < 160) {
      printf("M-^");
      f -= 64;
    }

    if (opt->s && f != '\n') {
      cn = 0;
    }
    if (opt->n && flag == '\n') {
      printf("%6d\t", count);
      flag = 0;
    }
    if (opt->n && f == '\n') {
      flag = '\n';
      count++;
    }
    if (opt->b && f == '\n' && sym_numbers == 1) {
      flag_b = '\n';
    }
    if (opt->b && flag_b != '\n' && flag_b_1 == '\n' && f != '\n') {
      printf("%6d\t", count_b);
      count_b++;
      flag_b = 0;
      flag_b_1 = 0;
    }
    if (opt->e && f == '\n') {
      printf("$");
    }
    if (opt->t && f == '\t') {
      printf("^I");
      continue;
    }
    flag_b_1 = f;
    flag_b = 0;
    printf("%c", f);
    sym_numbers++;
  }
  return 0;
}
