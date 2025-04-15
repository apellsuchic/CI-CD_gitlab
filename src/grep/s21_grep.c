#include "s21_grep.h"

int main(int argc, char *argv[]) {
  struct Opt opt;
  memset(&opt, 0, sizeof(opt));
  parser(argc, argv, &opt);
  if (!opt.e) {
    work_with_arg(argc, argv, &opt);
  }
  return 0;
}

void parser(int argc, char *argv[], struct Opt *opt) {
  int rez = 0;
  while ((rez = getopt(argc, argv, "ievclnhsf")) != -1) {
    switch (rez) {
      case 'i':
        opt->i = 1;
        break;
      case 'e':
        opt->e = 1;
        flag_e(argc, argv, opt);
        break;
      case 'v':
        opt->v = 1;
        break;
      case 'c':
        opt->c = 1;
        break;
      case 'l':
        opt->l = 1;
        break;
      case 'n':
        opt->n = 1;
        break;
      case 'h':
        opt->h = 1;
        break;
      case 's':
        opt->s = 1;
        break;
      case 'f':
        opt->f = 1;
        break;
    }
  }
}
int flag_f_file(char *patterns_file, char *patterns, struct Opt *opt) {
  int num_patterns = 0;
  int result = 0;
  FILE *fp = fopen(patterns_file, "r");
  if (fp == NULL) {
    if (!opt->s) {
      perror(patterns_file);
    }
  } else {
    char text[1024];
    while (fgets(text, sizeof(text), fp) != NULL) {
      if (text[0] == '\n') {
        continue;
      }
      text[strcspn(text, "\n")] = 0;
      if (num_patterns > 0) {
        strcat(patterns, "|");
      }
      strcat(patterns, text);
      num_patterns++;
    }
    fclose(fp);
    result = 1;
  }
  return result;
}
int flag_e(int argc, char *argv[], struct Opt *opt) {
  char pattern_buffer[1024] = {0};
  int num_patterns = 0;
  int i = 0;
  for (i = 0; i < argc; ++i) {
    if (strcmp(argv[i], "-e") == 0 && i + 1 < argc) {
      if (num_patterns > 0) {
        strcat(pattern_buffer, "|");
      }
      strcat(pattern_buffer, argv[++i]);
      num_patterns++;
      optind++;
    }
  }
  if ((optind + 1) < argc) {
    optind++;
  }
  if (optind < argc) {
    print_text(argc, argv, pattern_buffer, opt);
  } else {
    printf("Использование: grep [ПАРАМЕТР]… ШАБЛОНЫ [ФАЙЛ]…\n");
  }
  return 1;
}
void print_text(int argc, char *argv[], char *patterns, struct Opt *opt) {
  while (optind < argc) {
    FILE *fp = fopen(argv[optind], "r");
    if (fp == NULL) {
      optind++;
      if (!opt->s) {
        perror(argv[optind]);
      }
      continue;
    }
    work_with_text(patterns, fp, argc, argv[optind], opt);
    fclose(fp);
    optind++;
  }
}
void work_with_arg(int argc, char **argv, struct Opt *opt) {
  char *pattern = NULL;
  if (opt->f) {
    pattern = (char *)malloc(1024 * sizeof(char));
    if (pattern == NULL) {
      perror("Error: malloc");
    }
    if (flag_f_file(argv[optind++], pattern, opt) != 1) {
      free(pattern);
      pattern = NULL;
    }
  } else if (optind < argc) {
    pattern = argv[optind++];
  }
  if (optind < argc && pattern != NULL) {
    print_text(argc, argv, pattern, opt);
    if (opt->f) {
      free(pattern);
    }
  } else {
    printf("Использование: grep [ПАРАМЕТР]… ШАБЛОНЫ [ФАЙЛ]…\n");
  }
}

void work_with_text(char *pattern, FILE *file, int argc, char *file_name,
                    struct Opt *opt) {
  char *line = NULL;
  size_t len = 0;
  ssize_t read;
  int flag = REG_EXTENDED | REG_NOSUB;
  int count = 0;
  int count_line = 0;
  int result = 0;
  int flag_l = 0;
  while ((read = getline(&line, &len, file)) != -1) {
    line[strcspn(line, "\n")] = 0;
    count_line++;
    if (opt->i) {
      flag = REG_EXTENDED | REG_ICASE | REG_NOSUB;
    }
    result = find_pattern_regex(pattern, line, flag);
    if (opt->v) {
      if (!result) {
        if (argc > 4) {
          printf("%s:", file_name);
        }
        printf("%s\n", line);
      }
      continue;
    }
    if (opt->c && result) {
      count++;
      continue;
    }
    if (opt->l && result) {
      flag_l++;
      continue;
    }
    if (opt->n && result) {
      if (argc > 4) {
        printf("%s:", file_name);
      }
      printf("%d:%s\n", count_line, line);
      continue;
    }
    if ((argc <= 4 || opt->h) && result) {
      printf("%s\n", line);
    } else if (argc > 4 && result) {
      printf("%s:%s\n", file_name, line);
    }
  }
  if (flag_l > 0) {
    printf("%s\n", file_name);
  }
  if (opt->c) {
    if (argc > 4) {
      printf("%s:", file_name);
    }
    printf("%d\n", count);
  }
  if (line) {
    free(line);
  }
}

int find_pattern_regex(const char *pattern, const char *word, int flag) {
  regex_t compiled;
  int result;
  int res = 0;

  result = regcomp(&compiled, pattern, flag);

  if (result == 0) {
    result = regexec(&compiled, word, 0, NULL, 0);
    regfree(&compiled);
  }
  if (result == 0) {
    res++;
  }
  return res;
}