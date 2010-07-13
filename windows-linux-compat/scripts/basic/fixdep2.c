
#include <stdio.h>

static char *depfile;
static char *target;
static char *cmdline;

void usage(void)

{
	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
	exit(1);
}

/*
 * Print out the commandline prefixed with cmd_<target filename> :=
 */
void print_cmdline(void)
{
	printf("cmd_%s := %s\n\n", target, cmdline);
}

void print_deps(void)
{
  printf("print deps\n");  
}

void traps(void)
{
  printf("traps\n");
}

int main(int argc, char *argv[])
{
	traps();

	if (argc != 4)
		usage();

	depfile = argv[1];
	target = argv[2];
	cmdline = argv[3];

	print_cmdline();
	print_deps();

	return 0;
}
