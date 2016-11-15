#ifndef _SEMANAGE_DSO_H
#define _SEMANAGE_DSO_H	1

#ifdef SHARED
# define hidden __attribute__ ((visibility ("hidden")))
# define hidden_proto(fct)
# define hidden_def(fct)
#else
# define hidden
# define hidden_proto(fct)
# define hidden_def(fct)
#endif

#endif
