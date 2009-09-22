
#include <linux/winkvmint.h>

#define CHECK_TYPE_SIZE(typename, size) \
	do { \
		if (sizeof((typename)) != (size)) { \
			printk("%s type is incompatible!\n", #typename#); \			
			return 0; \			
		} \	   
	} while (0);

#define DO_CHECK_TYPE(type) \
	CHECK_TYPE_SIZE(type, type##_size);

#define _GEN_CHECK_TYPE_SIZE(compiler_name)								\	
	int compiler_name##_check_type_size(int __s8_size, int __u8_size,	\
									   int __s16_size, int __u16_size,	\
									   int __s32_size, int __u32_size,	\
									   int __s64_size, int __u64_size,	\
									   int u8_size, int u16_size,		\
									   int u32_size, int u64_size,		\
									   int s8_size, int s16_size,		\
									   int s32_size, int s64_size,		\
									   int int8_t_size, int int16_t_size, \
									   int int32_t_size, int int64_t_size, \
									   int uint8_t_size, int uint16_t_size, \
									   int uint32_t_size, int uint64_t_size) \	  
    {\
		DO_CHECK_TYPE(__s8);					\
		DO_CHECK_TYPE(__u8);					\
		DO_CHECK_TYPE(__s16);					\
		DO_CHECK_TYPE(__u16);					\
		DO_CHECK_TYPE(__s32);					\
		DO_CHECK_TYPE(__u32);					\
		DO_CHECK_TYPE(__s64);					\
		DO_CHECK_TYPE(__u64);					\
		DO_CHECK_TYPE(u8);						\
		DO_CHECK_TYPE(u16);						\
		DO_CHECK_TYPE(u32);						\
		DO_CHECK_TYPE(u64);						\
		DO_CHECK_TYPE(s8);						\
		DO_CHECK_TYPE(s16);						\
		DO_CHECK_TYPE(s32);						\
		DO_CHECK_TYPE(s64);						\
		DO_CHECK_TYPE(int8_t);					\
		DO_CHECK_TYPE(int16_t);					\
		DO_CHECK_TYPE(int32_t);					\
		DO_CHECK_TYPE(int64_t);					\
		DO_CHECK_TYPE(uint8_t);					\
		DO_CHECK_TYPE(uint16_t);				\
		DO_CHECK_TYPE(uint32_t);				\
		DO_CHECK_TYPE(uint64_t);				\
		return 1;								\
	}

#define DO_CHECK_ARG(id) \	
	do { \
		if ((val##id) != valid_val##id) { \
			return 0; \
		} \
	} while(0);

#define _DO_CHECK_SIZE(compier_name) \
	int compier_name##_check_argument_canonical(__s8 val1, int valid_val1, \												
											   __s16 val2, int valid_val2, \
											   __s32 val3, int valid_val3, \
											   __s64 val4, int valid_val4) \	
	{ \
		DO_CHECK_ARG(1);\
		DO_CHECK_ARG(2);\
		DO_CHECK_ARG(3);\
		DO_CHECK_ARG(4);\
		return 1;\
	}

