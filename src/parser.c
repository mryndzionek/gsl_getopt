#include <stdio.h>
#include "opts.h"

main(int argc, char **argv)
{
    opts_t *op = opts_parse(argc, argv);
    if(op != NULL)
    {
        opts_dump(op);
        opts_destroy(&op);
    }
    else
        printf("failed to parse arguments\n");
}
