#ifndef _SEPOL_DSO_H
#define _SEPOL_DSO_H	1

#if !defined(SHARED) || defined(ANDROID) || defined(__APPLE__)
    #define DISABLE_SYMVER 1
#endif

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
