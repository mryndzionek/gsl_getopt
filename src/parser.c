#include <stdio.h>
#include "opts.h"

main(int argc, char **argv)
{
    int rc;

    rc = opts_test(true);
    if(rc)
        printf("Selftest - passed\n");
    else
        {
            printf("Selftest - failed\n");
            return 1;
        }
    opts_t *op = opts_parse(argc, argv);
    if(op != NULL)
        {
            opts_dump(op);
            opts_destroy(&op);
        }
    else
        printf("failed to parse arguments\n");
}
